import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int countDown = 3;
  bool isCountingDown = false;

  void startCountDown() {
    setState(() {
      isCountingDown = true;
      countDown = 3;
    });
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (countDown > 0) {
          countDown--;
        } else {
          isCountingDown = false;
          timer.cancel();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Countdown Example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: isCountingDown ? null : startCountDown,
                child: Text('Start Countdown'),
              ),
              SizedBox(height: 20),
              isCountingDown
                  ? Text(
                      'Countdown: $countDown',
                      style: TextStyle(fontSize: 24),
                    )
                  : Text(
                      'Done',
                      style: TextStyle(fontSize: 24),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
