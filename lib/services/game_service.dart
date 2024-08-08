import 'package:mypitch_application/models/game.dart';

class GameService {
  Future<List<Game>> fetchLiveGames() async {
    return [
      Game(clubName1: 'Man Utd', clubName2: 'Arsenal', dayOfMatch: '09/08/2024', startTime: '18:00', competition: "Premier League", club1Picture: "assets/manutd.png", club2Picture: "assets/arsenal.png", competitionPicture: "assets/pl.png"),
      Game(clubName1: 'Man Utd', clubName2: 'Liverpool', dayOfMatch: '15/08/2024', startTime: '20:00', competition: "Premier League", club1Picture: "assets/manutd.png", club2Picture: "assets/Liverpool.png", competitionPicture: "assets/pl.png"),
      Game(clubName1: 'Man Utd', clubName2: 'Real Madrid', dayOfMatch: '21/08/2024', startTime: '21:00', competition: "UEFA Champions League", club1Picture: "assets/manutd.png", club2Picture: "assets/real.png", competitionPicture: "assets/cl.png"),
    ];
  }
}
