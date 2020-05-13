import 'package:flutter/material.dart';


// Liga e desliga da pagina de automação
class MainPageSwitch extends StatelessWidget {
  final bool isFanOn;
  final Function switchFan;

  MainPageSwitch({this.isFanOn,this.switchFan});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 6),
      child: GestureDetector(
        onTap: switchFan,
        child: Container(
          height: 20,width: 40,
          decoration: BoxDecoration(
              color: isFanOn?Colors.orange:Colors.grey[200],
              borderRadius: BorderRadius.circular(30)
          ),
          child: Padding(
              padding: EdgeInsets.all(3),
              child: Align(
                alignment: isFanOn?Alignment.centerRight:Alignment.centerLeft,
                child: Material(
                  elevation: 4,
                  shape: CircleBorder(),
                  child: Container(
                    width: 14,
                    height: 14,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)
                    ),
                  ),
                ),
              )
          ),
        ),
      ),
    );
  }
}