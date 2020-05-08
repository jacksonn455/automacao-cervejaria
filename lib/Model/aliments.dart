
import 'package:flutter/material.dart';
import 'package:velha_guarda/Model/aliment.dart';

class Aliments {
  static List<Aliment> aliments = [
    Aliment(
        name: "Apa",
        background: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [const Color(0xFFFD8183), const Color(0xFFFB425A)],
        ),
        image: "images/apa.svg",
        bottomImage: "images/cerveja1.svg",
        totalCalories: "Ler",
        runTime: 47.0,
        bikeTime: 45.0,
        swimTime: 41.0,
        workoutTime: 52.0),
    Aliment(
        name: "Bock",
        background: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [const Color(0xFFF8C08E), const Color(0xFFFDA65B)],
        ),
        image: "images/stout.svg",
        bottomImage: "images/cerveja2.svg",
        totalCalories: "Ler",
        runTime: 112.0,
        bikeTime: 69.0,
        swimTime: 61.0,
        workoutTime: 101.0),
    Aliment(
        name: "Ipa",
        background: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [const Color(0xFF6CD8F0), const Color(0xFF6AD89D)],
        ),
        image: "images/ipa.svg",
        bottomImage: "images/759627.svg",
        totalCalories: "Ler",
        runTime: 36.0,
        bikeTime: 31.0,
        swimTime: 25.0,
        workoutTime: 41.0),
    Aliment(
        name: "Pilsen",
        background: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [const Color(0xFFEE0979), const Color(0xFFFF6A00)],
        ),
        image: "images/pilsen.svg",
        bottomImage: "images/cerveja3.svg",
        totalCalories: "Ler",
        runTime: 40.0,
        bikeTime: 35.0,
        swimTime: 30.0,
        workoutTime: 50.0),
    Aliment(
        name: "Quadrupel",
        background: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [const Color(0xFFFBD3E9), const Color(0xFFBB377D)],
        ),
        image: "images/quadrupel.svg",
        bottomImage: "images/cerveja4.svg",
        totalCalories: "Ler",
        runTime: 33.0,
        bikeTime: 29.0,
        swimTime: 24.0,
        workoutTime: 39.0),
  ];
}