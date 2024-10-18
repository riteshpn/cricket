// class DomainCricketModel {
//   final String teamName;
//   final String img;
//   final List<String> players;
//   DomainCricketModel({
//     required this.teamName,
//     required this.img,
//     required this.players,
//   });
// }
// domain_cricket_model.dart


class DomainCricketModel {
  final String teamName;
  final String img;
  final List<DomainPlayerModel> players;

  DomainCricketModel({
    required this.teamName,
    required this.img,
    required this.players,
  });
}
class DomainPlayerModel {
  final String name;
  final String role;
  final String battingStyle;
  final String bowlingStyle;
  final String country;

  DomainPlayerModel({
    required this.name,
    required this.role,
    required this.battingStyle,
    required this.bowlingStyle,
    required this.country,
  });
}


