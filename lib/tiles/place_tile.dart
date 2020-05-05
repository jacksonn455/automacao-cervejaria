import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PlaceTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(
            height: 150.0,
            child: Image.asset(
              "images/super.png",
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Velha Guarda Cervejas Artesanais",
                  textAlign: TextAlign.start,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                ),
                Text(
                  "Rua Comendador Caetano Munaretto, 110",
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 15.0),
                ),
                Text(
                  "Erechim - RS",
                  textAlign: TextAlign.start,
                  style: TextStyle(color: Colors.grey[500], fontSize: 15.0),
                ),
                Text(
                  "CEP: 99711-278",
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 15.0),
                ),
                Text(
                  "+55 (54) 3321-0001",
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 15.0),
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                child: Text("Ver no Mapa"),
                textColor: Colors.orangeAccent,
                padding: EdgeInsets.zero,
                onPressed: () {
                  launch(
                      "https://www.google.com/maps/search/?api=1&query=-27.6445265,"
                      "-52.2878605");
                },
              ),
              FlatButton(
                child: Text("Ligar"),
                textColor: Colors.orange,
                padding: EdgeInsets.zero,
                onPressed: () {
                  launch("tel:(54)3321-0001");
                },
              ),
            ],
          ),
          Divider(),
        ],
      ),
    );
  }
}
