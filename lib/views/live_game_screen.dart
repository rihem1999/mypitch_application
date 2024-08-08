import 'package:flutter/material.dart';
import 'package:mypitch_application/models/game.dart';
import 'package:mypitch_application/views/home_screen.dart';
import 'dart:async';
import 'package:mypitch_application/widgets/tag_dialog.dart';
import 'package:mypitch_application/widgets/timer_display.dart';

class LiveGameScreen extends StatefulWidget {
  final Game game;

  LiveGameScreen({required this.game});

  @override
  _LiveGameScreenState createState() => _LiveGameScreenState();
}

class _LiveGameScreenState extends State<LiveGameScreen> {
  bool _isGameStarted = false;
  Timer? _timer;
  int _elapsedSeconds = 0;
  int _elapsedMinutes = 0;
  String? _selectedTeam;
  String? _tagDescription;
  List<Map<String, dynamic>> _tags = [];

  void _startGame() {
    setState(() {
      _isGameStarted = true;
      _elapsedSeconds = 0;
      _elapsedMinutes = 0;
    });

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _elapsedSeconds++;
        _elapsedMinutes = _elapsedSeconds ~/ 60;
      });
    });
  }

  String _formatMinutes(int minutes) {
    return '${minutes.toString().padLeft(2, '0')}\'';
  }

  void _addTag() {
    if (_selectedTeam != null && _tagDescription != null && _tagDescription!.isNotEmpty) {
      setState(() {
        _tags.add({
          'team': _selectedTeam,
          'description': _tagDescription,
          'time': _formatMinutes(_elapsedMinutes),
        });
        _tagDescription = '';
        _selectedTeam = null;
      });
      Navigator.of(context).pop();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Please select a team and enter a description'),
      ));
    }
  }

  void _showTagDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return TagDialog(
          selectedTeam: _selectedTeam,
          tagDescription: _tagDescription,
          teams: [widget.game.clubName1, widget.game.clubName2],
          onTeamChanged: (newValue) {
            setState(() {
              _selectedTeam = newValue;
            });
          },
          onDescriptionChanged: (value) {
            setState(() {
              _tagDescription = value;
            });
          },
          onSave: _addTag,
          onCancel: () {
            Navigator.of(context).pop();
          },
        );
      },
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF171A25),
      appBar: AppBar(
        backgroundColor: const Color(0xFF171A25),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () =>  Navigator.of(context).pushReplacement(MaterialPageRoute(
                                builder: (context) => HomeScreen(),
                              )),
        ),
        title: Row(
          children: [
            Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Image.asset(
                widget.game.competitionPicture, // replace with your game logo asset path
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              widget.game.competition,
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildTeamLogo(widget.game.club1Picture, widget.game.clubName1),
                  const Text(
                    '-',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  _buildTeamLogo(widget.game.club2Picture, widget.game.clubName2),
                ],
              ),
            ),
            Center(
              
                child: Text(widget.game.startTime, style: const  TextStyle(color: Colors.white),),
              ),
             const  SizedBox( height: 10),
            Center(
              child: ElevatedButton(
                onPressed: _isGameStarted ? null : _startGame,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(116, 229, 144, 1.0),
                  textStyle: const TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                  ),
                  minimumSize: const Size(0, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  disabledBackgroundColor: const Color.fromRGBO(116, 229, 144, 1.0),
                  disabledForegroundColor: Colors.white,
                ),
                child: Text(_isGameStarted ? 'Game Started' : 'Start Game'),
              ),
            ),
            if (_isGameStarted) Center(child: TimerDisplay(elapsedSeconds: _elapsedSeconds, textColor: Colors.white)),
            if (_isGameStarted) ...[
              Center(
                child: ElevatedButton(
                  onPressed: _showTagDialog,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(116, 229, 144, 1.0),
                    textStyle: const TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                    ),
                    minimumSize: const Size(0, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                  ),
                  child: const Text('Add Tag'),
                ),
              ),
              Expanded(
                child: ListView.separated(
                  itemCount: _tags.length,
                  separatorBuilder: (context, index) => const Divider(color: Colors.white),
                  itemBuilder: (context, index) {
                    final tag = _tags[index];
                    return ListTile(
                      title: Text(
                        '${tag['team']} - ${tag['description']}',
                        style: const TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(
                        'Time: ${tag['time']}',
                        style: const TextStyle(color: Colors.white),
                      ),
                    );
                  },
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildTeamLogo(String assetPath, String teamName) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
          ),
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(assetPath, width: 50, height: 50),
        ),
        const SizedBox(height: 8),
        Text(
          teamName,
          style: const TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
