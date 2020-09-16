
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:provider/provider.dart';
import 'package:velha_guarda/Model/card_info.dart';
import 'package:velha_guarda/components/back_card_view.dart';
import 'package:velha_guarda/components/front_card_view.dart';
import 'package:velha_guarda/components/input_view_pager.dart';
import 'package:velha_guarda/components/reset_button.dart';
import 'package:velha_guarda/components/round_button.dart';
import 'package:velha_guarda/constants/captions.dart';
import 'package:velha_guarda/constants/constanst.dart';
import 'package:velha_guarda/provider/card_cvv_provider.dart';
import 'package:velha_guarda/provider/card_name_provider.dart';
import 'package:velha_guarda/provider/card_number_provider.dart';
import 'package:velha_guarda/provider/card_valid_provider.dart';
import 'package:velha_guarda/provider/state_provider.dart';



typedef CardInfoCallback = void Function(
    InputState currentState, CardInfo cardInfo);

class CreditCardInputForm extends StatelessWidget {
  CreditCardInputForm(
      {this.onStateChange,
      this.cardHeight,
      this.frontCardDecoration,
      this.backCardDecoration,
      this.showResetButton = true,
      this.customCaptions,
      this.nextButtonTextStyle = kDefaultButtonTextStyle,
      this.prevButtonTextStyle = kDefaultButtonTextStyle,
      this.resetButtonTextStyle = kDefaultButtonTextStyle,
      this.nextButtonDecoration = defaultNextPrevButtonDecoration,
      this.prevButtonDecoration = defaultNextPrevButtonDecoration,
      this.resetButtonDecoration = defaultResetButtonDecoration});

  final Function onStateChange;
  final double cardHeight;
  final BoxDecoration frontCardDecoration;
  final BoxDecoration backCardDecoration;
  final bool showResetButton;
  final Map<String, String> customCaptions;
  final BoxDecoration nextButtonDecoration;
  final BoxDecoration prevButtonDecoration;
  final BoxDecoration resetButtonDecoration;
  final TextStyle nextButtonTextStyle;
  final TextStyle prevButtonTextStyle;
  final TextStyle resetButtonTextStyle;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => StateProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CardNumberProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CardNameProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CardValidProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CardCVVProvider(),
        ),
        Provider(
          create: (_) => Captions(customCaptions: customCaptions),
        ),
      ],
      child: CreditCardInputImpl(
        onCardModelChanged: onStateChange,
        backDecoration: backCardDecoration,
        frontDecoration: frontCardDecoration,
        cardHeight: cardHeight,
        showResetButton: showResetButton,
        prevButtonDecoration: prevButtonDecoration,
        nextButtonDecoration: nextButtonDecoration,
        resetButtonDecoration: resetButtonDecoration,
        prevButtonTextStyle: prevButtonTextStyle,
        nextButtonTextStyle: nextButtonTextStyle,
        resetButtonTextStyle: resetButtonTextStyle,
      ),
    );
  }
}

class CreditCardInputImpl extends StatefulWidget {
  final CardInfoCallback onCardModelChanged;
  final double cardHeight;
  final BoxDecoration frontDecoration;
  final BoxDecoration backDecoration;
  final bool showResetButton;
  final BoxDecoration nextButtonDecoration;
  final BoxDecoration prevButtonDecoration;
  final BoxDecoration resetButtonDecoration;
  final TextStyle nextButtonTextStyle;
  final TextStyle prevButtonTextStyle;
  final TextStyle resetButtonTextStyle;

  CreditCardInputImpl(
      {this.onCardModelChanged,
      this.cardHeight,
      this.showResetButton,
      this.frontDecoration,
      this.backDecoration,
      this.nextButtonTextStyle,
      this.prevButtonTextStyle,
      this.resetButtonTextStyle,
      this.nextButtonDecoration,
      this.prevButtonDecoration,
      this.resetButtonDecoration});

  @override
  _CreditCardInputImplState createState() => _CreditCardInputImplState();
}

class _CreditCardInputImplState extends State<CreditCardInputImpl> {
  final PageController pageController = PageController(
    viewportFraction: 0.92,
    initialPage: 0,
  );

  final GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();

  final cardHorizontalpadding = 12;
  final cardRatio = 16.0 / 9.0;

  var _currentState = InputState.NUMBER;

  @override
  Widget build(BuildContext context) {
    final newState = Provider.of<StateProvider>(context).getCurrentState();

    final name = Provider.of<CardNameProvider>(context).cardName;

    final cardNumber = Provider.of<CardNumberProvider>(context).cardNumber;

    final valid = Provider.of<CardValidProvider>(context).cardValid;

    final cvv = Provider.of<CardCVVProvider>(context).cardCVV;

    final captions = Provider.of<Captions>(context);

    if (newState != _currentState) {
      _currentState = newState;

      Future(() {
        widget.onCardModelChanged(
            _currentState,
            CardInfo(
                name: name, cardNumber: cardNumber, validate: valid, cvv: cvv));
      });
    }

    double cardWidth =
        MediaQuery.of(context).size.width - (2 * cardHorizontalpadding);

    double cardHeight;
    if (widget.cardHeight != null && widget.cardHeight > 0) {
      cardHeight = widget.cardHeight;
    } else {
      cardHeight = cardWidth / cardRatio;
    }

    final frontDecoration = widget.frontDecoration != null
        ? widget.frontDecoration
        : defaultCardDecoration;
    final backDecoration = widget.backDecoration != null
        ? widget.backDecoration
        : defaultCardDecoration;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: FlipCard(
            speed: 300,
            flipOnTouch: _currentState == InputState.DONE,
            key: cardKey,
            front:
                FrontCardView(height: cardHeight, decoration: frontDecoration),
            back: BackCardView(height: cardHeight, decoration: backDecoration),
          ),
        ),
        Stack(
          children: [
            AnimatedOpacity(
              opacity: _currentState == InputState.DONE ? 0 : 1,
              duration: Duration(milliseconds: 500),
              child: InputViewPager(
                pageController: pageController,
              ),
            ),
            Align(
                alignment: Alignment.center,
                child: AnimatedOpacity(
                    opacity: widget.showResetButton &&
                            _currentState == InputState.DONE
                        ? 1
                        : 0,
                    duration: Duration(milliseconds: 500),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ResetButton(
                        decoration: widget.resetButtonDecoration,
                        textStyle: widget.resetButtonTextStyle,
                        onTap: () {
                          if (!widget.showResetButton) {
                            return;
                          }

                          Provider.of<StateProvider>(context, listen: false)
                              .moveFirstState();
                          pageController.animateToPage(0,
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeIn);

                          if (!cardKey.currentState.isFront) {
                            cardKey.currentState.toggleCard();
                          }
                        },
                      ),
                    ))),
          ],
        ),
        Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
          AnimatedOpacity(
            opacity: _currentState == InputState.NUMBER ||
                    _currentState == InputState.DONE
                ? 0
                : 1,
            duration: Duration(milliseconds: 500),
            child: RoundButton(
                decoration: widget.prevButtonDecoration,
                textStyle: widget.prevButtonTextStyle,
                buttonTitle: captions.getCaption('Voltar'),
                onTap: () {
                  if (InputState.DONE == _currentState) {
                    return;
                  }

                  if (InputState.NUMBER != _currentState) {
                    pageController.previousPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeIn);
                  }

                  if (InputState.CVV == _currentState) {
                    cardKey.currentState.toggleCard();
                  }
                  Provider.of<StateProvider>(context, listen: false)
                      .movePrevState();
                }),
          ),
          SizedBox(
            width: 10,
          ),
          AnimatedOpacity(
            opacity: _currentState == InputState.DONE ? 0 : 1,
            duration: Duration(milliseconds: 500),
            child: RoundButton(
                decoration: widget.nextButtonDecoration,
                textStyle: widget.nextButtonTextStyle,
                buttonTitle: _currentState == InputState.CVV ||
                        _currentState == InputState.DONE
                    ? captions.getCaption('Finalizar')
                    : captions.getCaption('Próximo'),
                onTap: () {
                  if (InputState.CVV != _currentState) {
                    pageController.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeIn);
                  }

                  if (InputState.VALIDATE == _currentState) {
                    cardKey.currentState.toggleCard();
                  }

                  Provider.of<StateProvider>(context, listen: false)
                      .moveNextState();
                }),
          ),
          SizedBox(
            width: 25,
          )
        ])
      ],
    );
  }
}
