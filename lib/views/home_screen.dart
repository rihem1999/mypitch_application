import 'package:flutter/material.dart';
import 'package:mypitch_application/viewmodels/game_viewmodel.dart';
import 'package:mypitch_application/views/live_game_screen.dart';
import 'package:mypitch_application/widgets/card_game.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final gameViewModel = Provider.of<GameViewModel>(context, listen: false);

    // Fetch games when the screen is built
    gameViewModel.fetchLiveGames();

    return Scaffold(
      backgroundColor: const Color(0xFF171A25),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Add padding around the content
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text(
                  'Hi, Rihem',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
                const Spacer(), // Pushes the avatar to the right side
                // Square avatar with border
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    border: Border.all(
                      color: const Color.fromRGBO(116, 229, 144, 1.0), // Border color
                      width: 2.0, // Border width
                    ),
                    borderRadius: BorderRadius.circular(8.0), // Border radius for square shape
                    color: Colors.grey.shade800, // Background color
                  ),
                  child: const Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 32,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16), // Add some space between text and content
            Expanded(
              child: Consumer<GameViewModel>(
                builder: (context, viewModel, child) {
                  return viewModel.games.isEmpty
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: Color.fromRGBO(116, 229, 144, 1.0),
                          ),
                        ) // Show loading indicator
                      : ListView.builder(
                          itemCount: viewModel.games.length,
                          itemBuilder: (context, index) {
                            final game = viewModel.games[index];
                            return Container(
                              margin: const EdgeInsets.only(bottom: 16), // Space between cards
                              child: SizedBox(
                                height: MediaQuery.of(context).size.height * 0.2, // 20% of screen height
                                child: GameCard(
                                  game: game,
                                  onEnterDugout: () {
                                    Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                        builder: (context) => LiveGameScreen(game: game),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            );
                          },
                        );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
