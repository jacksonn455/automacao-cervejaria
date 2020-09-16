
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velha_guarda/constants/captions.dart';
import 'package:velha_guarda/constants/constanst.dart';
import 'package:velha_guarda/provider/card_name_provider.dart';

class CardName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final defaultName =
        Provider.of<Captions>(context).getCaption('Nome / Sobrenome').toUpperCase();
    final String name =
        Provider.of<CardNameProvider>(context).cardName.toUpperCase();

    return Text(name.isNotEmpty ? name : defaultName,
        style: name.isNotEmpty ? kNametextStyle : kDefaultNameTextStyle);
  }
}
