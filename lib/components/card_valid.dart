
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:velha_guarda/constants/captions.dart';
import 'package:velha_guarda/constants/constanst.dart';
import 'package:velha_guarda/provider/card_valid_provider.dart';


class CardValid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String inputCardValid = Provider.of<CardValidProvider>(context).cardValid;

    var defaultCardValid = Provider.of<Captions>(context)
        .getCaption('MM/AA')
        .substring(inputCardValid.length);

    inputCardValid = inputCardValid.replaceAll("/", "");

    switch (inputCardValid.length) {
      case 3:
        inputCardValid =
            inputCardValid[0] + inputCardValid[1] + '/' + inputCardValid[2];
        break;
      case 4:
        inputCardValid = inputCardValid[0] +
            inputCardValid[1] +
            '/' +
            inputCardValid[2] +
            inputCardValid[3];
        break;
    }

    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Text(
          inputCardValid,
          style: kValidtextStyle,
        ),
        Text(
          defaultCardValid,
          style: kDefaultValidTextStyle,
        )
      ],
    ));
  }
}
