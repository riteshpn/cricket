// post_detail_data_model.dart
class ApiResponse {
  final List<Team> data;
  final String status;

  ApiResponse({required this.data, required this.status});

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      data: (json['data'] as List).map((e) => Team.fromJson(e)).toList(),
      status: json['status'],
    );
  }
}

class Team {
  final String teamName;
  final String img;
  final List<Player> players;

  Team({required this.teamName, required this.img, required this.players});

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
      teamName: json['teamName'],
      img: json['img'],
      players:
          (json['players'] as List).map((e) => Player.fromJson(e)).toList(),
    );
  }
}

class Player {
  final String id;
  final String name;
  final String role;
  final String battingStyle;
  final String? bowlingStyle;
  final String country;
  final String playerImg;

  Player({
    required this.id,
    required this.name,
    required this.role,
    required this.battingStyle,
    this.bowlingStyle,
    required this.country,
    required this.playerImg,
  });

  factory Player.fromJson(Map<String, dynamic> json) {
    return Player(
      id: json['id'],
      name: json['name'],
      role: json['role'],
      battingStyle: json['battingStyle'],
      bowlingStyle: json['bowlingStyle'],
      country: json['country'],
      playerImg: json['playerImg'],
    );
  }
}
