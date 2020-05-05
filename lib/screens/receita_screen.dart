import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:velha_guarda/screens/apa_screen.dart';
import 'package:velha_guarda/screens/home_screen.dart';
import 'package:velha_guarda/screens/info_screen.dart';
import 'package:velha_guarda/screens/ipa_screen.dart';
import 'package:velha_guarda/screens/pilsen_screen.dart';
import 'package:velha_guarda/screens/quadrupel_screen.dart';
import 'package:velha_guarda/screens/rampa_screen.dart';
import 'package:velha_guarda/screens/strong_screen.dart';

class RecipeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RecipeScreenState();
  }
}

class RecipeScreenState extends State<RecipeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.orange,
        title: Text('Receitas', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        leading: new IconButton(
            icon: new Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => InfoScreen()));
            }),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        children: <Widget>[
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage("images/recipe3.png"),
            ),
            title: Text(
              "Strong Ale",
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 13.0),
            ),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => StrongScreen()));
            },
          ),
          Divider(),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage("images/recipe3.png"),
            ),
            title: Text(
              "Quadrupel",
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 13.0),
            ),
            onTap: () async {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => QuadrupelScreen()));
            },
          ),
          Divider(),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage("images/recipe3.png"),
            ),
            title: Text(
              "Indian Pale Ale",
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 13.0),
            ),
            onTap: () async {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => IpaScreen()));
            },
          ),
          Divider(),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage("images/recipe3.png"),
            ),
            title: Text(
              "American Pale Ale",
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 13.0),
            ),
            onTap: () async {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => ApaScreen()));
            },
          ),
          Divider(),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage("images/recipe3.png"),
            ),
            title: Text(
              "Pilsen",
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 13.0),
            ),
            onTap: () async {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => PilsenScreen()));
            },
          ),
          Divider(),
        ],
      ),
    );
  }
}
