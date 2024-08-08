import 'package:flutter/material.dart';

class TagDialog extends StatelessWidget {
  final String? selectedTeam;
  final String? tagDescription;
  final List<String> teams;
  final ValueChanged<String?> onTeamChanged;
  final ValueChanged<String> onDescriptionChanged;
  final VoidCallback onSave;
  final VoidCallback onCancel;

  TagDialog({
    required this.selectedTeam,
    required this.tagDescription,
    required this.teams,
    required this.onTeamChanged,
    required this.onDescriptionChanged,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    return AlertDialog(
      backgroundColor: const Color(0xFF171A25),
      title: const Text(
        'Add Tag',
        style: TextStyle(color: Colors.white, fontFamily: 'Montserrat'),
      ),
      content: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: screenWidth * 0.8, // Ensure dialog is not too wide
            maxHeight: screenHeight * 0.5, // Ensure dialog is not too tall
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DropdownButtonFormField<String>(
                value: selectedTeam,
                onChanged: onTeamChanged,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: 'Select Team',
                  labelStyle: const TextStyle(color: Colors.black, fontFamily: 'Montserrat'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                ),
                items: teams.map((team) {
                  return DropdownMenuItem<String>(
                    value: team,
                    child: Text(
                      team,
                      style: const TextStyle(color: Colors.black, fontFamily: 'Montserrat'),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 16),
              TextField(
                onChanged: onDescriptionChanged,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: 'Tag Description',
                  labelStyle: const TextStyle(color: Colors.black, fontFamily: 'Montserrat'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                ),
                style: const TextStyle(color: Colors.black, fontFamily: 'Montserrat'),
              ),
            ],
          ),
        ),
      ),
      actions: [
      OutlinedButton(
  onPressed: onCancel,
  style: OutlinedButton.styleFrom(
    side: const BorderSide(color: Color.fromRGBO(116, 229, 144, 1.0), width: 2), // Border color and width
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(6.0), // Border radius
    ),
  ),
  child: const Text(
    'Cancel',
    style: TextStyle(
      color: Colors.white,
      fontFamily: 'Montserrat',
      letterSpacing: 1.0,
      fontSize: 14.0,
      fontWeight: FontWeight.w600 // Adjust the letter spacing here
    ),
  ),
)
,
        ElevatedButton(
          onPressed: onSave,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromRGBO(116, 229, 144, 1.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6.0),
            ),
          ),
          child: const Text(
            'Save',
             
            style: TextStyle(fontFamily: 'Montserrat',
            fontSize: 14.0,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.0,
            color: Color(0xFF171A25)),
          ),
        ),
      ],
    );
  }
}
