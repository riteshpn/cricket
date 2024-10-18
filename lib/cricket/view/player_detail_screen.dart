import 'package:cricket/cricket/model/domai_model.dart/domain_cricket_model.dart';
import 'package:cricket/cricket/view/players_details.dart';
import 'package:flutter/material.dart';

class PlayerListScreen extends StatelessWidget {
  final List<DomainPlayerModel> players;
  final String teamName;

  PlayerListScreen({
    required this.players,
    required this.teamName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("$teamName Players"),
      ),
      body: ListView.builder(
        itemCount: players.length,
        itemBuilder: (context, index) {
          final player = players[index];
          return ListTile(
            title: Text(player.name),
            subtitle: Text("${player.role}, ${player.country}"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PlayerDetailScreen(player: player),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
