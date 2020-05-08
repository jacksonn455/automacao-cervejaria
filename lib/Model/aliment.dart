import 'package:flutter/material.dart';

class Aliment {
  final String name;
  final LinearGradient background;
  final String image;
  final String bottomImage;
  final String totalCalories;
  final double runTime;
  final double bikeTime;
  final double swimTime;
  final double workoutTime;

  Aliment({ this.name,
    this.background,
    this.image,
    this.bottomImage,
    this.totalCalories,
    this.runTime,
    this.bikeTime,
    this.swimTime,
    this.workoutTime
  });

}