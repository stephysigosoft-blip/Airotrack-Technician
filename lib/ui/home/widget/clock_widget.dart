import 'dart:async';

import 'package:flutter/material.dart';

class ClockWidget extends StatefulWidget {
  const ClockWidget({super.key});

  @override
  State<ClockWidget> createState() => _ClockWidgetState();
}

class _ClockWidgetState extends State<ClockWidget> {
  String _currentTime = '';
  String _currentPeriod = '';

  @override
  void initState() {
    super.initState();
    _updateTime();
    Timer.periodic(const Duration(seconds: 1), (timer) {
      _updateTime();
    });
  }

  void _updateTime() {
    setState(() {
      _currentTime = _getCurrentTime();
      _currentPeriod = _getCurrentPeriod();
    });
  }

  String _getCurrentTime() {
    DateTime now = DateTime.now();
    return '${now.hour}:${now.minute}:${now.second < 10 ? "0${now.second}" : now.second} ';
  }

  String _getCurrentPeriod() {
    DateTime now = DateTime.now();
    return now.hour < 12 ? 'AM' : 'PM';
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(_currentTime,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Colors.white,
                  fontSize: 15,
                )),
        Text(_currentPeriod,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Colors.white,
                  fontSize: 15,
                )),
      ],
    );
  }
}
