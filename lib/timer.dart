import 'package:flutter/material.dart';
import 'package:pomodore_timer/animation.dart';
import 'dart:async';
import 'package:pomodore_timer/pause.dart';

class TimerPage extends StatefulWidget {
  final int value;

  TimerPage({Key? key, required this.value}) : super(key: key);

  @override
  _TimerPageState createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  int minutes = 0;
  int restante = 0;
  bool isPaused = false;
  double opacity = 0;
  //late AnimationController _controller;

  get timer => null;
  initState() {
    startTimer();
    _startAnimation();
    minutes = widget.value;
  }

  AnimationController _controller = new AnimationController(
    vsync: SpriteDemoState(),
  );

  String buttomPauseRestetText = "Pausar";

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
                      "$minutes",
                    ),
                    Opacity(
                      opacity: opacity,
                      child: ConstrainedBox(
                        constraints:
                            BoxConstraints.tightFor(width: 200, height: 120),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Color.fromRGBO(245, 47, 87, 1),
                            ),
                            onPressed: () {},
                            child: Text(
                              "PAUSADO",
                              style: TextStyle(
                                fontSize: 30,
                              ),
                            )),
                      ),
                    )
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
                  setState(() {
                    if (buttomPauseRestetText == "Pausar") {
                      _controller.stop();
                      restante = minutes;
                      opacity = 1;
                      isPaused = true;
                      buttomPauseRestetText = "Continuar";
                    } else if (buttomPauseRestetText == "Continuar") {
                      opacity = 0;
                      minutes = restante;
                      isPaused = false;
                      startTimer();
                      _controller.repeat(
                        period: Duration(seconds: 1),
                      );
                      buttomPauseRestetText = "Pausar";
                    }
                  });
                },
                child: Text(buttomPauseRestetText),
              ),
            ),
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

  void _startAnimation() {
    _controller.stop();
    _controller.reset();
    _controller.repeat(
      period: Duration(seconds: 1),
    );
  }

  void startTimer() {
    const oneMin = const Duration(minutes: 1);
    new Timer.periodic(
      oneMin,
      (timer) {
        if (minutes == 0) {
          setState(() {
            timer.cancel();
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Pause()));
          });
        } else if (isPaused) {
          setState(() {
            minutes++;
          });
        } else {
          setState(() {
            minutes--;
          });
        }
      },
    );
  }

  _maisTres() {
    setState(() {
      minutes = minutes + 3;
    });
  }
}
