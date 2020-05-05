import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velha_guarda/Model/homepagedata.dart';
import 'package:velha_guarda/util/util_smarthome.dart';


class HomeAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomePageData>(
      builder: (context, data,child){
      return  Padding(
        padding: const EdgeInsets.only(top: 58),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  getCurrentDate,
                  style:
                  dateTextStyle.copyWith(color: Colors.grey[700]),
                ),
                Text(
                  'Automação',
                  style: homeTitleTextStyle,
                )
              ],
            ),
          ],
        ),
      );
      },
    );
  }
}