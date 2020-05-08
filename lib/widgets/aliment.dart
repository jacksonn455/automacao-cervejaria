
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:velha_guarda/Model/aliment.dart';


class AlimentWidget extends StatelessWidget {
  final LinearGradient theme;
  final Aliment aliment;
  final VoidCallback increment;
  final VoidCallback decrement;

  AlimentWidget({
    @required this.aliment,
    @required this.theme,
    this.increment,
    this.decrement
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        SvgPicture.asset(
          aliment.image,
          width: 70.0,
          height: 60.0,
        ),
        Container(
          child: Column(
            children: <Widget>[
              Text(aliment.name,
                  style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Qwigley')),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  color: theme.colors[0]
              ),
              width: 60,
              height: 1.0,
            ),
            Container(
              child: OutlineButton(
                borderSide: BorderSide(color: theme.colors[0]),
                onPressed: () async {},
                shape: StadiumBorder(),
                child: SizedBox(
                  width: 60.0,
                  height: 45.0,
                  child: Center(
                      child: Text('${aliment.totalCalories}',
                          style: TextStyle(
                              color: theme.colors[0],
                              fontSize: 17.0,
                              fontWeight: FontWeight.w400
                          ),
                          textAlign: TextAlign.center)),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: theme.colors[0]
              ),
              width: 70,
              height: 1.0,
            ),
          ],
        ),
        Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    SvgPicture.asset(
                      "images/agua.svg",
                      width: 30.0,
                      height: 30.0,
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    SvgPicture.asset(
                      "images/malte.svg",
                      width: 30.0,
                      height: 30.0,
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    SvgPicture.asset(
                      "images/lupulo.svg",
                      width: 30.0,
                      height: 30.0,
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    SvgPicture.asset(
                      "images/fermento.svg",
                      width: 30.0,
                      height: 30.0,
                    ),
                  ],
                ),
              ],
            )
        ),
      ],
    );
  }
}