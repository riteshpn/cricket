import 'package:flutter/material.dart';
import 'package:cricket/cricket/model/domai_model.dart/domain_cricket_model.dart';

class PlayerDetailScreen extends StatelessWidget {
  final DomainPlayerModel player; 

  PlayerDetailScreen({required this.player});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(player.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Name: ${player.name}", style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            Text("Role: ${player.role}", style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text("Batting Style: ${player.battingStyle}",
                style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text("Bowling Style: ${player.bowlingStyle}",
                style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text("Country: ${player.country}", style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
