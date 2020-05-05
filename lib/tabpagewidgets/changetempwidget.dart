import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:velha_guarda/Model/homeinfodata.dart';

import 'package:velha_guarda/icons/my_flutter_app_icons.dart';

// pagina temperatura
class ChangeTempWidget extends StatelessWidget {
  final int setTemp;

  ChangeTempWidget(this.setTemp);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeInfoData>(
      builder: (context, infoData,child){
        final bool isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
        return Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: isPortrait?30:2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        CustomIcons.temperatire,
                        size: 30,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        setTemp.toString(),
                        style: TextStyle(
                            fontSize: 80, fontWeight: FontWeight.bold),

                      ),
                      SizedBox(
                        width: 2,
                      ),

                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: Text(
                      '°C',
                      style: TextStyle(color: Colors.grey, fontSize: 20),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text('TEMPERATURA'),
            ),
          ],
        );
      },
    );
  }
}
