import 'package:flutter/material.dart';
import 'package:velha_guarda/screens/automacao_screen.dart';
import 'package:velha_guarda/screens/main.dart';


class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          "images/beer_background.jpg",
          fit: BoxFit.cover,
          height: 1000,
        ),
        CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              floating: true,
              snap: true,
              backgroundColor: Colors.orangeAccent,
              elevation: 0.0,
              actions: <Widget>[
                IconButton(
                  disabledColor: Colors.white,
                  icon: Icon(Icons.add, color: Colors.white),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) =>  AutomacaoScreen()));
                  },
                ),
              ],
              flexibleSpace: FlexibleSpaceBar(
                title: const Text("Novidades", style: TextStyle(color: Colors.white)),
                centerTitle: true,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
