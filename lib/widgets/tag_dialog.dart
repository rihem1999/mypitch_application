import 'package:flutter/material.dart';

class TagDialog extends StatefulWidget {
  final String? selectedTeam;
  final String? tagDescription;
  final List<String> teams;
  final ValueChanged<String?> onTeamChanged;
  final ValueChanged<String?> onDescriptionChanged;
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
  _TagDialogState createState() => _TagDialogState();
}

class _TagDialogState extends State<TagDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add Tag'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          DropdownButton<String>(
            value: widget.selectedTeam,
            hint: Text('Select a team'),
            items: widget.teams.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: widget.onTeamChanged,
          ),
          TextField(
            onChanged: widget.onDescriptionChanged,
            decoration: InputDecoration(labelText: 'Enter tag description'),
            controller: TextEditingController(text: widget.tagDescription),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: widget.onCancel,
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: widget.onSave,
          child: Text('Save'),
        ),
      ],
    );
  }
}
