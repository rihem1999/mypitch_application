import 'package:flutter/material.dart';
import 'package:mypitch_application/models/game.dart';

class GameCard extends StatelessWidget {
  final Game game;
  final VoidCallback onEnterDugout;

  GameCard({required this.game, required this.onEnterDugout});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    // Taille des polices et des images ajustées dynamiquement
    double clubNameFontSize = screenWidth < 350 ? 12.0 : screenWidth < 500 ? 16.0 : 20.0;
    double imageSize = screenWidth < 350 ? 20.0 : screenWidth < 500 ? 30.0 : 40.0;
    FontWeight clubNameFontWeight =
        screenWidth < 350 ? FontWeight.normal : FontWeight.bold;

    return Container(
      color: const Color(0xFF31343F),
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
                          width: imageSize, // Taille de l'image dynamique
                          height: imageSize, // Taille de l'image dynamique
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 8.0),
                      Expanded(
                        child: Text(
                          game.clubName1,
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: clubNameFontWeight,
                            fontSize: clubNameFontSize, // Taille de la police dynamique
                            color: Colors.white,
                          ),
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
                        borderRadius: BorderRadius.circular(6.0),
                        child: Image.asset(
                          game.club2Picture,
                          width: imageSize, // Taille de l'image dynamique
                          height: imageSize, // Taille de l'image dynamique
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 8.0),
                      Expanded(
                        child: Text(
                          game.clubName2,
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: clubNameFontWeight,
                            fontSize: clubNameFontSize, // Taille de la police dynamique
                            color: Colors.white,
                          ),
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
                backgroundColor: const Color.fromRGBO(116, 229, 144, 1.0),
                minimumSize: const Size(120, 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.0),
                ),
              ),
              child: const Text(
                'Enter Dugout',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.0,
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
