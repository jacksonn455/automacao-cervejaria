import 'package:flutter/material.dart';

// Temperatura da geladeira/freezer
class CurrentTempWidget extends StatelessWidget {
  final String currentTemp;

  CurrentTempWidget(this.currentTemp);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          'Temperatura Atual.',
          style: TextStyle(color: Colors.grey),
        ),
        Text(
          currentTemp,
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
          ),
        )
      ],
    );
  }
}
