import 'package:flutter/material.dart';
import 'package:velha_guarda/homepagewidget/homeappbar.dart';

import 'homepagecard.dart';


class HomeLandScapeLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        HomeAppBar(),
        SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            HomePageCard(
              index: 0,
            ),
            HomePageCard(
              index: 1,
            ),
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