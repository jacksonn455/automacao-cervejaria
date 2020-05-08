import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velha_guarda/bloc/timer_bloc.dart';
import 'package:velha_guarda/bloc/timer_event.dart';
import 'package:velha_guarda/bloc/timer_state.dart';
import 'package:velha_guarda/screens/main.dart';

import 'package:velha_guarda/ticker.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class RampaScreen extends StatefulWidget {
  State<RampaScreen> createState() => _RampaScreenState();
}

class _RampaScreenState extends State<RampaScreen> {
  final TimerBloc _timerBloc = TimerBloc(ticker: Ticker());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.orange,
        accentColor: Colors.orangeAccent,
        brightness: Brightness.light,
      ),
      home: BlocProvider(
        bloc: _timerBloc,
        child: Timer(),
      ),
    );
  }

  @override
  void dispose() {
    _timerBloc.dispose();
    super.dispose();
  }
}

class Timer extends StatelessWidget {
  static const TextStyle timerTextStyle = TextStyle(
    fontSize: 60,
    fontWeight: FontWeight.bold, color: Colors.white
  );

  @override
  Widget build(BuildContext context) {
    final TimerBloc _timerBloc = BlocProvider.of<TimerBloc>(context);
    return Scaffold(
      appBar: (AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.grey[200],
        elevation: 0,
        title: Text('Rampa de fervura', style: TextStyle(color: Colors.orange)),
        centerTitle: true,
        leading: new IconButton(
            icon: new Icon(Icons.arrow_back),
            color:Colors.orange,
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => Home()));
            }
        ),
      )),
      body: Stack(
        children: [
          Background(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: 100.0),
                child: Center(
                  child: BlocBuilder(
                    bloc: _timerBloc,
                    builder: (context, state) {
                      final String minutesStr = ((state.duration / 60) % 60)
                          .floor()
                          .toString()
                          .padLeft(2, '0');
                      final String secondsStr = (state.duration % 60)
                          .floor()
                          .toString()
                          .padLeft(2, '0');
                      return Text(
                        '$minutesStr:$secondsStr',
                        style: Timer.timerTextStyle,
                      );
                    },
                  ),
                ),
              ),
              BlocBuilder(
                condition: (previousState, currentState) =>
                    currentState.runtimeType != previousState.runtimeType,
                bloc: _timerBloc,
                builder: (context, state) => Actions(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Actions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: _mapStateToActionButtons(
        timerBloc: BlocProvider.of<TimerBloc>(context),
      ),
    );
  }

  List<Widget> _mapStateToActionButtons({
    TimerBloc timerBloc,
  }) {
    final TimerState state = timerBloc.currentState;
    if (state is Ready) {
      return [
        FloatingActionButton(
          child: Icon(Icons.play_arrow, color: Colors.white),
          onPressed: () => timerBloc.dispatch(Start(duration: state.duration)),
        ),
      ];
    }
    if (state is Running) {
      return [
        FloatingActionButton(
          child: Icon(Icons.pause, color: Colors.white),
          onPressed: () => timerBloc.dispatch(Pause()),
        ),
        FloatingActionButton(
          child: Icon(Icons.replay, color: Colors.white),
          onPressed: () => timerBloc.dispatch(Reset()),
        ),
      ];
    }
    if (state is Paused) {
      return [
        FloatingActionButton(
          child: Icon(Icons.play_arrow, color: Colors.white),
          onPressed: () => timerBloc.dispatch(Resume()),
        ),
        FloatingActionButton(
          child: Icon(Icons.replay, color: Colors.white),
          onPressed: () => timerBloc.dispatch(Reset()),
        ),
      ];
    }
    if (state is Finished) {
      return [
        FloatingActionButton(
          child: Icon(Icons.replay, color: Colors.white),
          onPressed: () => timerBloc.dispatch(Reset()),
        ),
      ];
    }
    return [];
  }
}

class Background extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WaveWidget(
      config: CustomConfig(
        gradients: [
          [
            Color.fromRGBO(242, 206, 28, 1),
            Color.fromRGBO(242, 206, 28, 1),
            Color.fromRGBO(242, 206, 28, 1),
          ],
          [
            Color.fromRGBO(242, 199, 286, 1),
            Color.fromRGBO(242, 199, 28, 1),
            Color.fromRGBO(242, 199, 28, 0.7)
          ],
          [
            Color.fromRGBO(242, 142, 28, 1),
            Color.fromRGBO(232, 182, 74, 1),
            Color.fromRGBO(240, 211, 105, 1),
          ],
        ],
        durations: [19440, 10800, 6000],
        heightPercentages: [0.03, 0.01, 0.02],
        gradientBegin: Alignment.bottomCenter,
        gradientEnd: Alignment.topCenter,
      ),
      size: Size(double.infinity, double.infinity),
      waveAmplitude: 25,
      backgroundColor: Colors.white,
    );
  }
}
