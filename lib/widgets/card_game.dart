import 'package:flutter/material.dart';
import 'package:mypitch_application/models/game.dart';

class GameCard extends StatelessWidget {
  final Game game;
  final VoidCallback onEnterDugout;

  GameCard({required this.game, required this.onEnterDugout});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF31343F), // Set the card background color here
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Club 1 Image with Name
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(6.0),
                        child: Image.asset(
                          game.club1Picture,
                          width: 40, // Adjust width as needed
                          height: 40, // Adjust height as needed
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 12.0),
                      Text(
                        game.clubName1,
                        style: const TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8.0),
                  // Club 2 Image with Name
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          game.club2Picture,
                          width: 40, // Adjust width as needed
                          height: 40, // Adjust height as needed
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 12.0),
                      Text(
                        game.clubName2,
                        style: const TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    '${game.dayOfMatch}  ${game.startTime}',
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontFamily: 'Montserrat',
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: onEnterDugout,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(116, 229, 144, 1.0), // Button background color
                minimumSize: const Size(120, 60), // Set button height here
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.0), // Rounded corners
                ),
              ),
              child: const Text(
                'Enter Dugout',
              
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.0, // Adjust the spacing here
                  fontFamily: 'Montserrat',
                  color: Color(0xFF171A25),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
