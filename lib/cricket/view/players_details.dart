import 'package:cricket/cricket/model/domai_model.dart/domain_cricket_model.dart';
import 'package:flutter/material.dart';

class PlayerDetailScreen extends StatelessWidget {
  final DomainPlayerModel player;

  PlayerDetailScreen({required this.player});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(player.name),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(player.image),
                  backgroundColor: Colors.grey[300],
                ),
              ),
              SizedBox(height: 20),
              Text(
                player.name,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(
                        colors: [
                          Colors.green,
                          Colors.greenAccent,
                        ],
                        begin: Alignment.bottomRight,
                        end: Alignment.bottomRight),
                  ),
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Role with Icon
                      Row(
                        children: [
                          Icon(Icons.sports_cricket, color: Colors.white),
                          SizedBox(width: 10),
                          Text(
                            "Role: ${player.role}",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),

                      Row(
                        children: [
                          Icon(Icons.sports_baseball, color: Colors.white),
                          SizedBox(width: 10),
                          Text(
                            "Batting Style: ${player.battingStyle}",
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      // Bowling Style with Icon
                      Row(
                        children: [
                          Icon(Icons.sports_tennis, color: Colors.white),
                          SizedBox(width: 10),
                          Text(
                            "Bowling Style: ${player.bowlingStyle}",
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      // Country with Icon
                      Row(
                        children: [
                          Icon(Icons.flag, color: Colors.white),
                          SizedBox(width: 10),
                          Text(
                            "Country: ${player.country}",
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
