import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ClockWidget extends StatefulWidget {
  final double size;
  final Color textColor;

  const ClockWidget({Key? key, required this.size, required this.textColor})
      : super(key: key);

  @override
  _ClockWidgetState createState() => _ClockWidgetState();
}

class _ClockWidgetState extends State<ClockWidget> {
  late Timer _timer;
  DateTime _now = DateTime.now();

  @override
  void initState() {
    _now = DateTime.now();
    _timer = new Timer.periodic(
      Duration(seconds: 1),
      (Timer timer) {
        setState(() {
          _now = DateTime.now();
        });
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextStyle? textStyle = Theme.of(context)
        .textTheme
        .labelLarge
        ?.copyWith(color: widget.textColor);
    return Container(
      height: widget.size,
      //padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          SizedBox(height: 16),
          FittedBox(
            fit: BoxFit.contain,
            child: Text(
              DateFormat('EEEE').format(_now),
              style: textStyle,
            ),
          ),
          //const Divider(thickness: 1),
          FittedBox(
            fit: BoxFit.contain,
            child: Text(
              DateFormat.jm().format(_now),
              style: textStyle,
            ),
          ),
          SizedBox(height: 16),
        ],
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      ),
      alignment: Alignment.center,
    );
  }
}
