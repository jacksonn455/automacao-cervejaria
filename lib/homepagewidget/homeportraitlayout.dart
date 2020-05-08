import 'package:flutter/material.dart';

import 'homepagecard.dart';



class HomePortraitLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 30),
        Row(
          children: <Widget>[
            HomePageCard(
              index: 0,
            ),
            HomePageCard(
              index: 1,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            HomePageCard(
              index: 3,
            ),
            HomePageCard(
              index: 4,
            ),
          ],
        ),
        SizedBox(height: 30,)

      ],
    );
  }
}