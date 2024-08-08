import 'package:flutter/material.dart';
import 'package:mypitch_application/viewmodels/game_viewmodel.dart';
import 'package:mypitch_application/views/live_game_screen';
import 'package:mypitch_application/widgets/card_game.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final gameViewModel = Provider.of<GameViewModel>(context, listen: false);

    // Fetch games when the screen is built
    gameViewModel.fetchLiveGames();

    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Consumer<GameViewModel>(
        builder: (context, viewModel, child) {
          return viewModel.games.isEmpty
              ? const Center(child: CircularProgressIndicator()) // Show loading indicator
              : Column(
                  children: [
                    const Text('Hi, {username}'),
                    Expanded(
                      child: ListView.builder(
                        itemCount: viewModel.games.length,
                        itemBuilder: (context, index) {
                          final game = viewModel.games[index];
                          return GameCard(
                            game: game,
                            onEnterDugout: () {
                              Navigator.of(context).pushReplacement(MaterialPageRoute(
                              builder: (context) => LiveGameScreen(),));
                            },
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
