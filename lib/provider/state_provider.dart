import 'package:flutter/material.dart';
import 'package:velha_guarda/constants/constanst.dart';


class StateProvider with ChangeNotifier {
  var _currentState = InputState.NUMBER;

  final _states = [
    InputState.NUMBER,
    InputState.NAME,
    InputState.VALIDATE,
    InputState.CVV,
    InputState.DONE
  ];

  var currentIndex = 0;

  void moveNextState() {
    if (currentIndex < _states.length - 1) {
      currentIndex++;
      _currentState = _states[currentIndex];
      notifyListeners();
    }
  }

  void moveFirstState() {
    currentIndex = 0;
    _currentState = _states[currentIndex];
    notifyListeners();
  }

  void movePrevState() {
    if (currentIndex > 0) {
      currentIndex--;
      _currentState = _states[currentIndex];
      notifyListeners();
    }
  }

  InputState getCurrentState() {
    return _currentState;
  }
}
