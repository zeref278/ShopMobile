import 'dart:async';
import 'package:flutter/material.dart';
import 'package:project/constants.dart';


class CountDownTimer extends StatefulWidget {
  const CountDownTimer({
    Key? key,
    required this.timeStart,
  }) : super(key: key);

  final String timeStart;

  @override
  State<StatefulWidget> createState() => _CountDownTimerState();
}

class _CountDownTimerState extends State<CountDownTimer>
    with TickerProviderStateMixin {
  Duration duration = Duration();
  Timer? timer;

  void startTimer() {
    if (mounted) {
      timer = Timer.periodic(const Duration(seconds: 1), (_) => addTime());
    }
  }

  void addTime() {
    if (mounted) {
      const addSeconds = -1;
      setState(() {
        final seconds = duration.inSeconds + addSeconds;

        if (seconds < 0) {
          timer!.cancel();
        } else {
          duration = Duration(seconds: seconds);
        }
      });
    }
  }

  @override
  void initState() {
    super.initState();
    duration = DateTime.parse(widget.timeStart).difference(DateTime.now());
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return buildTime();
  }

  Widget buildTime() {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final days = twoDigits(duration.inDays);
    final hours = twoDigits(duration.inHours.remainder(24));
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return Row(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: defaultPrimaryColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            '$days',
            style: TextStyle(
                fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        Text(':',
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold
            )),
        Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: defaultPrimaryColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            '$hours',
            style: TextStyle(
                fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        Text(':',
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold
            )),
        Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: defaultPrimaryColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            '$minutes',
            style: TextStyle(
                fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        Text(':',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold
            )),
        Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: defaultPrimaryColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            '$seconds',
            style: TextStyle(
                fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold,),
          ),
        ),
      ],
    );
  }
}