import 'package:flutter/material.dart';
import 'dart:async';

class Time extends StatefulWidget {
  @override
  _TimeState createState() => _TimeState();
}

class _TimeState extends State<Time> {
  static const duration = const Duration(seconds: 1);

  int secondsPassed = 100;
  bool isActive = false;

  Timer timer;

  void handleTick() {
    if (isActive) {
      setState(() {
        secondsPassed = secondsPassed - 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (timer == null) {
      timer = Timer.periodic(duration, (Timer t) {
        handleTick();
      });
    }
    int low = 0;
    int seconds = secondsPassed % 60;
    int minutes = secondsPassed ~/ 60;
    int hours = secondsPassed ~/ (60 * 60);
    if (seconds == low) {
      isActive = false;
    }
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              LabelText(value: hours.toString().padLeft(2, '0')),
              Text(":"),
              LabelText(value: minutes.toString().padLeft(2, '0')),
              Text(":"),
              LabelText(value: seconds.toString().padLeft(2, '0')),
            ],
          ),
          // Container(
          //   width: 50,
          //   height: 20,
          //   child: RaisedButton(
          //     child: Text(
          //       isActive ? 'STOP' : 'START',
          //       style: TextStyle(fontSize: 5),
          //     ),
          //     onPressed: () {
          //       setState(() {
          //         isActive = !isActive;
          //       });
          //     },
          //   ),
          // )
        ],
      ),
    );
  }
}

class LabelText extends StatelessWidget {
  LabelText({this.label, this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 0),
      padding: EdgeInsets.all(0),
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.circular(25),
      //   color: Colors.teal,
      // ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            '$value',
            style: TextStyle(
                color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}