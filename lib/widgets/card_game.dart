import 'package:flutter/material.dart';
import 'package:mypitch_application/models/game.dart';

class GameCard extends StatelessWidget {
  final Game game;
  final VoidCallback onEnterDugout;

  GameCard({required this.game, required this.onEnterDugout});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF31343F), // Set the card background color here
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                // Club 1 Image with Name
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        game.club1Picture,
                        width: 20,
                        height: 20,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 12.0),
                    Text(
                      game.clubName1,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 3.0),
                // Club 2 Image with Name
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        game.club2Picture,
                        width: 20,
                        height: 20,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 12.0),
                    Text(
                      game.clubName2,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 3.0),
                Text(
                  '${game.dayOfMatch}  ${game.startTime}',
                  style: const TextStyle(
                    fontSize: 12.0,
                    color: Colors.white,
                  ),
                ), // Enter Dugout Button with Spacer
              ],
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: onEnterDugout,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(
                    116, 229, 144, 1.0), // Button background color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.0), // Rounded corners
                ),
              ),
              child: const Text('Enter Dugout'),
            ),
          ],
        ),
      ),
    );
  }
}
