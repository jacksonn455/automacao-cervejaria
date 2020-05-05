import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:velha_guarda/Model/homepagedata.dart';
import 'package:velha_guarda/util/util_smarthome.dart';

class MusicCardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double screenSize = MediaQuery.of(context).size.width;
    final double cardWidth = (screenSize - 60) / 2;
    final bool isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    return Consumer<HomePageData>(
      builder: (context,data,child){
        bool isActive = data.roomInfoData[2].isActive;
        return Card(
          elevation: isActive?10:0,
          color: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0)),
          child: Container(
            height: isPortrait ? cardWidth*.95:cardWidth*0.2,
            width: isPortrait?double.infinity:cardWidth*80,
            child: Padding(
              padding: EdgeInsets.all(6),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Icon(
                    data.roomInfoData[2].iconData,
                    size: 50,
                    color: isActive?Colors.orange:Colors.grey,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Receitas",
                        style: homeTitleTextStyle.copyWith(
                            fontSize: 20,
                          color: isActive?Colors.black:Colors.grey,
                        ),),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.fast_rewind,color: Colors.grey,size: 30,),
                      GestureDetector(
                        onTap: (){
                          data.switchOffAll(data.roomInfoData[2]);
                        },
                        child: Icon(
                          isActive?Icons.play_arrow:Icons.pause,
                          color: isActive?Colors.orange:Colors.grey,
                          size: 40,
                        ),
                      ),
                      Icon(Icons.fast_forward,color: Colors.grey,size: 30,),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
