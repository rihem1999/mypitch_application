import 'package:flutter/material.dart';

class TimerDisplay extends StatelessWidget {
  final int elapsedSeconds;
  final Color textColor;

  TimerDisplay({required this.elapsedSeconds, this.textColor = Colors.white});

  String _formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        _formatTime(elapsedSeconds),
        style: TextStyle(fontSize: 24, color: textColor),
      ),
    );
  }
}
