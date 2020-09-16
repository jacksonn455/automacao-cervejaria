import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velha_guarda/Model/aliments.dart';
import 'package:velha_guarda/widgets/aliment.dart';
import 'package:velha_guarda/widgets/card_item.dart';
import 'package:velha_guarda/widgets/page.dart' as mypage;
import 'package:velha_guarda/widgets/pager.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BurnOff',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ReceitaPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ReceitaPage extends StatelessWidget {
  ReceitaPage() {
    SystemChrome.setPreferredOrientations(
        <DeviceOrientation>[DeviceOrientation.portraitUp]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: MenuPager(
          children: Aliments.aliments
              .map(
                (aliment) => mypage.Page(
                      title: "Receitas",
                      background: aliment.background,
                      icon: aliment.bottomImage,
                      child: CardItem(
                        child: AlimentWidget(
                          aliment: aliment,
                          theme: aliment.background,
                        ),
                      ),
                    ),
              )
              .toList(),
        ),
      ),
    );
  }
}
