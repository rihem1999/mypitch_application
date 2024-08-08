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

    // Obtenez la taille de l'écran
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFF171A25),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.04), // Padding relatif à la largeur de l'écran
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Hi, Rihem',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Montserrat',
                      fontSize: screenWidth * 0.05, // Taille de police réactive
                      fontWeight: FontWeight.normal),
                ),
                const Spacer(), // Pushes the avatar to the right side
                // Square avatar with border
                Container(
                  width: screenWidth * 0.13, // Taille réactive pour l'avatar
                  height: screenWidth * 0.13, // Taille réactive pour l'avatar
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    border: Border.all(
                      color: const Color.fromRGBO(
                          116, 229, 144, 1.0), // Border color
                      width: 2.0, // Border width
                    ),
                    borderRadius: BorderRadius.circular(
                        8.0), // Border radius for square shape
                    color: Colors.grey.shade800, // Background color
                  ),
                  child: const Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 32, // Taille de l'icône inchangée
                  ),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.02), // Espace réactif entre les éléments
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
                              margin: EdgeInsets.only(
                                  bottom: screenHeight * 0.02), // Espacement réactif entre les cartes
                              child: SizedBox(
                                height: screenHeight *
                                    0.3, // 25% of screen height for each card
                                child: GameCard(
                                  game: game,
                                  onEnterDugout: () {
                                    Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            LiveGameScreen(game: game),
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
