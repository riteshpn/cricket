import 'package:cricket/cricket/model/data_model.dart/cricket_data_model.dart'; // API response models
import 'package:cricket/cricket/model/domai_model.dart/domain_cricket_model.dart'; // Domain models
import 'package:cricket/cricket/repo/cricket_repo_service.dart'; // API service
import 'package:flutter/material.dart';

class CricketProvider extends ChangeNotifier {
  String cricketMatches = "Cricket Matches";
  String tapView = 'Tap to see players';
  List<DomainCricketModel> _cricket = [
    DomainCricketModel(
      teamName: "Aus vs Ind",
      img:
          "https://www.cricadium.com/wp-content/uploads/2024/10/Cricadium-2024-10-12T183240.828-jpg.webp",
      players: [
        DomainPlayerModel(
          name: "Virat Kohli",
          role: "Batsman",
          battingStyle: "Right Handed Bat",
          bowlingStyle: "None",
          country: "India",
          image: "",
        ),
        DomainPlayerModel(
            name: "Player 2",
            role: "Bowler",
            battingStyle: "Left Handed Bat",
            bowlingStyle: "Right-arm offbreak",
            country: "Australia",
            image: ""),
      ],
    )
  ];

  List<DomainCricketModel> get cricket => _cricket;

  CricketProvider() {
    _initialize();
  }

  void _initialize() async {
    await fetchCricketData();
  }

  Future<void> fetchCricketData() async {
    notifyListeners();
    final cricketService = ApiServiceImpl();
    try {
      ApiResponse cricketTeamList = await cricketService.fetchTeamDetails();

      List<DomainCricketModel> cricketTeamNames = [];
      for (int i = 0; i < cricketTeamList.data.length; i++) {
        var team = cricketTeamList.data[i];
        print(team);

        List<DomainPlayerModel> playerDetails = [];
        for (int p = 0; p < team.players.length; p++) {
          var player = team.players[p];

          var playerDomainModel = DomainPlayerModel(
              name: player.name,
              role: player.role,
              battingStyle: player.battingStyle,
              bowlingStyle: player.bowlingStyle ?? "None",
              country: player.country,
              image: player.playerImg);

          playerDetails.add(playerDomainModel);
        }
        var cricketModel = DomainCricketModel(
          teamName: team.teamName,
          img: team.img,
          players: playerDetails,
        );

        cricketTeamNames.add(cricketModel);
      }

      _cricket = cricketTeamNames;
      notifyListeners();
    } catch (e) {
      print('Error fetching cricket data: $e');
    }
  }
}
