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
        title: Text(
          teamName,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold,),
        ),
      ),
      body: ListView.builder(
        itemCount: players.length,
        itemBuilder: (context, index) {
          final player = players[index];
          return Padding(
            padding:const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Card(
              color: Colors.blueGrey.shade200,
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(15),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PlayerDetailScreen(player: player),
                    ),
                  );
                },
                child: ListTile(
                  title: Text(
                    player.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                  subtitle: Text(
                    "${player.role}, ${player.country}",
                    style: TextStyle(
                        color: Colors.grey[700],
                        fontWeight: FontWeight.bold,
                        fontSize: 13),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 15),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
