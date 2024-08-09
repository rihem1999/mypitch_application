import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mypitch_application/viewmodels/game_viewmodel.dart';
import 'package:mypitch_application/views/live_game_screen.dart';
import 'package:mypitch_application/widgets/card_game.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final gameViewModel = Provider.of<GameViewModel>(context, listen: false);

    // Fetch games when the screen is built
    gameViewModel.fetchLiveGames();

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFF171A25),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context, screenWidth),
            SizedBox(height: screenHeight * 0.02),
            Expanded(
              child: _buildGameList(context, screenHeight),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, double screenWidth) {
    return Row(
      children: [
        Text(
          'Hi, Rihem',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Montserrat',
            fontSize: screenWidth * 0.05,
            fontWeight: FontWeight.normal,
          ),
        ),
        const Spacer(),
        _buildAvatar(screenWidth),
      ],
    );
  }

  Widget _buildAvatar(double screenWidth) {
    return Container(
      width: screenWidth * 0.13,
      height: screenWidth * 0.13,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        border: Border.all(
          color: const Color.fromRGBO(116, 229, 144, 1.0),
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.grey.shade800,
      ),
      child: const Icon(
        Icons.person,
        color: Colors.white,
        size: 32,
      ),
    );
  }

  Widget _buildGameList(BuildContext context, double screenHeight) {
    return Consumer<GameViewModel>(
      builder: (context, viewModel, child) {
        if (viewModel.games.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(
              color: Color.fromRGBO(116, 229, 144, 1.0),
            ),
          );
        }

        return ListView.builder(
          itemCount: viewModel.games.length,
          itemBuilder: (context, index) {
            final game = viewModel.games[index];
            return Container(
              margin: EdgeInsets.only(bottom: screenHeight * 0.02),
              child: SizedBox(
                height: screenHeight * 0.3,
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
    );
  }
}
