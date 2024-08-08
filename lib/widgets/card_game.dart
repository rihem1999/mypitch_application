import 'package:flutter/material.dart';
import 'package:mypitch_application/models/game.dart';

class GameCard extends StatelessWidget {
  final Game game;
  final VoidCallback onEnterDugout;

  GameCard({required this.game, required this.onEnterDugout});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: ListTile(
        title: Text('${game.clubName1} vs ${game.clubName2}'),
        subtitle: Text('Start time: ${game.startTime}'),
        trailing: ElevatedButton(
          onPressed: onEnterDugout,
          child: Text('Enter Dugout'),
        ),
      ),
    );
  }
}
