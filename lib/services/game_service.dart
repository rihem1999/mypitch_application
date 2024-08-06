import 'package:mypitch_application/models/game.dart';

class GameService {
  Future<List<Game>> fetchLiveGames() async {
    // Simuler la récupération des jeux en direct
    await Future.delayed(Duration(seconds: 2));
    return [
      Game(clubName1: 'Club A', clubName2: 'Club B', startTime: DateTime.now()),
      Game(clubName1: 'Club C', clubName2: 'Club D', startTime: DateTime.now().subtract(Duration(minutes: 15))),
    ];
  }
}
