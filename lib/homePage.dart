import 'dart:async';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Duration duration = Duration();
  Timer? timer;
  bool isClicked = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
    resetTimer();
  }

  void resetTimer() {
    stopTimer();
    // setState(() {});
    duration = Duration();
  }

  void stopTimer() {
    setState(() {
      timer?.cancel();
    });
  }

  void startTimer() {
    stopTimer();
    timer = Timer.periodic(Duration(seconds: 1), (_) => addTime());
  }

  void addTime() {
    final addSeconds = 1;
    setState(() {
      final seconds = duration.inSeconds + addSeconds;
      duration = Duration(seconds: seconds);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(37, 27, 55, 1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                      colors: [
                        Colors.yellowAccent,
                        Colors.pink,
                        Colors.tealAccent,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight
                  )
              ),
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                minRadius: 155,
                child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                          colors: [
                            Color.fromRGBO(21, 0, 80, 1),
                            // Colors.brown.shade400,
                            Color.fromRGBO(87, 10, 87, 1)
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight
                      )
                  ),
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    minRadius: 140,
                    child: buildTime(),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size(100, 40),
                elevation: 8,
                backgroundColor: Colors.green,
              ),
              onPressed: (){
               startTimer();
              },
              child: Text(
                "START",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(100, 40),
                    elevation: 8,
                    backgroundColor: Colors.red,
                  ),
                  onPressed: () {
                    stopTimer();
                  },
                  child: Text(
                    "STOP",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  width: 100,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(100, 40),
                    elevation: 8,
                    backgroundColor: Colors.purpleAccent,
                  ),
                  onPressed: () {
                    resetTimer();
                  },
                  child: Text(
                    "RESET",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildTime() {
    String twoDigit(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigit(duration.inHours);
    final minutes = twoDigit(
      duration.inMinutes.remainder(60),
    );
    final seconds = twoDigit(
      duration.inSeconds.remainder(60),
    );
    // final milliseconds = twoDigit(
    //   duration.inMilliseconds.remainder(100)
    // );

    return Text(
      "$hours : $minutes : $seconds ",
      style: TextStyle(
        fontSize: 40,
      ),
    );
  }
}
