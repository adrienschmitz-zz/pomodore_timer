import 'package:flutter/material.dart';
import 'dart:async';

import 'package:pomodore_timer/home.dart';

import 'animation.dart';

class Pause extends StatefulWidget {
  const Pause({Key? key}) : super(key: key);

  @override
  _PauseState createState() => _PauseState();
}

class _PauseState extends State<Pause> {
  int start = 5;
  initState() {
    startTimer();
    _startAnimation();
  }

  AnimationController _controller = new AnimationController(
    vsync: SpriteDemoState(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).accentColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
              height: 300,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(alignment: Alignment.center, children: [
                    new CustomPaint(
                      painter: new SpritePainter(_controller),
                      child: new SizedBox(
                        width: 290.0,
                        height: 290.0,
                      ),
                    ),
                    Text(
                      "$start",
                    ),
                  ]),
                ],
              ),
            ),
            SizedBox(
              height: 55,
            ),
            SizedBox(
              height: 70,
              width: 110,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
                child: Text("Ao trabalho"),
              ),
            )
          ],
        ),
        floatingActionButton: new FloatingActionButton(
          onPressed: () {
            _maisTres();
          },
          tooltip: "+3 minitos",
          child: Text("+3m"),
        ));
  }

  void startTimer() {
    const oneMin = const Duration(minutes: 1);
    new Timer.periodic(
      oneMin,
      (timer) {
        if (start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            start--;
          });
        }
      },
    );
  }

  void _startAnimation() {
    _controller.stop();
    _controller.reset();
    _controller.repeat(
      period: Duration(seconds: 1),
    );
  }

  _maisTres() async {
    setState(() {
      start = start + 3;
    });
    await Future.delayed(const Duration(seconds: 2), () {
      startTimer();
    });
  }
}
