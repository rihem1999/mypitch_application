import 'package:flutter/material.dart';
import 'package:mypitch_application/viewmodels/game_viewmodel.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Consumer<GameViewModel>(
        builder: (context, viewModel, child) {
          return Column(
            children: [
              Text('Hi, Rihem}'),
              Expanded(
                child: ListView.builder(
                  itemCount: viewModel.games.length,
                  itemBuilder: (context, index) {
                    final game = viewModel.games[index];
                    return ListTile(
                      title: Text('${game.clubName1} vs ${game.clubName2}'),
                      subtitle: Text('Start time: ${game.startTime}'),
                      trailing: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/game', arguments: game);
                        },
                        child: Text('Enter Dugout'),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
