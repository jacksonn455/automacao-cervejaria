import 'package:flutter/material.dart';
import 'package:fluttery_dart2/animations.dart';

import 'dart:math';

import 'package:velha_guarda/Model/homeinfodata.dart';
import 'package:velha_guarda/dialwidget/controlknob.dart';


class CircleGestureDetector extends StatefulWidget {

  final HomeInfoData infoModel;
  final int index;

  CircleGestureDetector({this.infoModel,this.index});

  @override
  _CircleGestureDetectorState createState() => _CircleGestureDetectorState();
}

class _CircleGestureDetectorState extends State<CircleGestureDetector> {

  double _seekPrecent=0.0;
  PolarCoord _startDragCoord;
  double _startDragPreCent;
  double _currentDragPreCent;



  _onRadialDragStart(PolarCoord coord){
    _startDragCoord = coord;
    _startDragPreCent =widget.infoModel.infoModel(widget.index).knobReading;
  }

  _onRadialDragUpdate(PolarCoord coord){
    if(_startDragCoord!=null){
      final dragAngle = coord.angle-_startDragCoord.angle;
      final dragPreCent = dragAngle/(2*pi);
      final dragValue = (_startDragPreCent+dragPreCent)%1.0.clamp(0.0, 0.5);
      final max1= (dragValue*31*2).round();

      setState(() {
        final bool isFanOn = widget.infoModel.infoData[widget.index].isFanOn;
        if(isFanOn){
          _currentDragPreCent = dragValue??0.0;
          widget.infoModel.setKnobPreCent(widget.infoModel.infoData[widget.index], _currentDragPreCent??_seekPrecent);
          widget.infoModel.changeTemp(widget.infoModel.infoModel(widget.index), max1);
          print('darcoord: ${max1}');

        }
      }
      );

    }


  }

  onRadialDragEnd(){
    final bool isFanOn = widget.infoModel.infoData[widget.index].isFanOn;
    if(isFanOn){
      setState(() {
        _seekPrecent = _currentDragPreCent;
        _currentDragPreCent = null;
        _startDragCoord=null;
        _startDragPreCent=0.0;
      });
    }


  }

  @override
  Widget build(BuildContext context) {
    return RadialDragGestureDetector(
      onRadialDragStart: _onRadialDragStart,
      onRadialDragUpdate: _onRadialDragUpdate,
      onRadialDragEnd: onRadialDragEnd,

      child: ControlKnob(widget.infoModel.getKnobReading(widget.index)),

    );
  }

}