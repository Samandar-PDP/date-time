import 'dart:async';

import 'package:flutter/cupertino.dart';

class TimeText extends StatefulWidget {
  const TimeText({super.key});

  @override
  State<TimeText> createState() => _TimeTextState();
}

class _TimeTextState extends State<TimeText> {

  String _currentTime() {
    final currentTime = DateTime.now();
    final hour = currentTime.hour;
    final minute = currentTime.minute;
    final seconds = currentTime.second;
    return "$hour:$minute:$seconds";
  }


  @override
  Widget build(BuildContext context) {

    Timer(const Duration(seconds: 1), () {
      setState(() {

      });
    });

    return Center(child: Text(_currentTime(),style: TextStyle(fontSize: 30),));
  }
}
