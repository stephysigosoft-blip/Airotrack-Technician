import 'dart:async';

import 'package:flutter/material.dart';

class ClockWidget extends StatefulWidget {
  const ClockWidget({Key? key}) : super(key: key);

  @override
  State<ClockWidget> createState() => _ClockWidgetState();
}

class _ClockWidgetState extends State<ClockWidget> {
  String _currentTime = '';
  String _currentPeriod = '';
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _updateTime();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        _updateTime();
      }
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
    int hour = now.hour % 12;
    hour = hour == 0 ? 12 : hour;
    return '${hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}:${now.second.toString().padLeft(2, '0')} ';
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
