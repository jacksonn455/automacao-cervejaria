import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:velha_guarda/constants/constanst.dart';
import 'package:velha_guarda/provider/card_cvv_provider.dart';

class CardCVV extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<CardCVVProvider>(
      builder: (context, value, child) {
        return Padding(
          padding: const EdgeInsets.all(3.0),
          child: Container(
            height: 40,
            width: 70,
            color: Colors.white,
            child: Center(
              child: Text(
                value.cardCVV,
                style: kCVCTextStyle,
              ),
            ),
          ),
        );
      },
    );
  }
}
