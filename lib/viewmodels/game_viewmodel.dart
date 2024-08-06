import 'package:flutter/material.dart';
import 'package:mypitch_application/models/game.dart';
import 'package:mypitch_application/services/game_service.dart';


class GameViewModel extends ChangeNotifier {
  final GameService _gameService = GameService();
  List<Game> _games = [];

  List<Game> get games => _games;

  Future<void> fetchLiveGames() async {
    _games = await _gameService.fetchLiveGames();
    notifyListeners();
  }
}
