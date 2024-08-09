import 'package:flutter/material.dart';
import 'package:mypitch_application/models/game.dart';

class GameCard extends StatelessWidget {
  final Game game; // The game details to be displayed
  final VoidCallback onEnterDugout; // Callback for when the "Enter Dugout" button is pressed

  // Constructor to initialize the game and callback
  GameCard({required this.game, required this.onEnterDugout});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width; // Get the screen width

    // Adjust font size and image size based on screen width
    double clubNameFontSize = screenWidth < 350 ? 12.0 : screenWidth < 500 ? 16.0 : 20.0;
    double imageSize = screenWidth < 350 ? 20.0 : screenWidth < 500 ? 30.0 : 40.0;
    FontWeight clubNameFontWeight = screenWidth < 350 ? FontWeight.normal : FontWeight.bold;

    return Container(
      color: const Color(0xFF31343F), // Background color of the card
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0), // Margin around the card
      child: Padding(
        padding: const EdgeInsets.all(16.0), // Padding inside the card
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Row for Club 1 with Image and Name
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(6.0), // Rounded corners for image
                        child: Image.asset(
                          game.club1Picture, // Image for Club 1
                          width: imageSize, // Dynamic image size
                          height: imageSize, // Dynamic image size
                          fit: BoxFit.cover, // Scale image to cover its container
                        ),
                      ),
                      const SizedBox(width: 8.0), // Space between image and text
                      Expanded(
                        child: Text(
                          game.clubName1, // Name of Club 1
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: clubNameFontWeight, // Dynamic font weight
                            fontSize: clubNameFontSize, // Dynamic font size
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8.0), // Space between rows
                  
                  // Row for Club 2 with Image and Name
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(6.0), // Rounded corners for image
                        child: Image.asset(
                          game.club2Picture, // Image for Club 2
                          width: imageSize, // Dynamic image size
                          height: imageSize, // Dynamic image size
                          fit: BoxFit.cover, // Scale image to cover its container
                        ),
                      ),
                      const SizedBox(width: 8.0), // Space between image and text
                      Expanded(
                        child: Text(
                          game.clubName2, // Name of Club 2
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: clubNameFontWeight, // Dynamic font weight
                            fontSize: clubNameFontSize, // Dynamic font size
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8.0), // Space between rows
                  
                  // Column for match day with truncation if needed
                  Flexible(
                    child: Text(
                      game.dayOfMatch, // Match day
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                      ),
                      overflow: TextOverflow.ellipsis, // Truncate text with "..." if too long
                      maxLines: 1, // Limit to a single line
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16.0), // Space between game details and button
            Column(
              children: [
                ElevatedButton(
                  onPressed: onEnterDugout, // Callback for button press
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(116, 229, 144, 1.0), // Button background color
                    minimumSize: const Size(120, 60), // Minimum size of the button
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.0), // Rounded corners for button
                    ),
                  ),
                  child: const Text(
                    'Enter Dugout', // Button text
                    style: TextStyle(
                      fontSize: 12, // Font size for button text
                      fontWeight: FontWeight.w600, // Font weight for button text
                      letterSpacing: 1.0, // Spacing between letters
                      fontFamily: 'Montserrat',
                      color: Color(0xFF171A25), // Color of the button text
                    ),
                  ),
                ),
                const SizedBox(height: 8.0), // Space between button and start time
                Flexible(
                  child: Text(
                    game.startTime, // Start time
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontFamily: 'Montserrat',
                      color: Colors.white,
                    ),
                    overflow: TextOverflow.ellipsis, // Truncate text with "..." if too long
                    maxLines: 1, // Limit to a single line
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
