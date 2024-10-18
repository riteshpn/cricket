import 'package:cricket/cricket/view/player_detail_screen.dart';
import 'package:cricket/cricket/view_model/cricket_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CricketListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Consumer<CricketProvider>(
          builder: (context, cricketProvider, child) {
            return Text(
              cricketProvider.cricketMatches,
              style: const TextStyle(fontWeight: FontWeight.bold),
            );
          },
        ),
      ),
      body: Consumer<CricketProvider>(
        builder: (context, cricketProvider, child) {
          return ListView.builder(
            itemCount: cricketProvider.cricket.length,
            itemBuilder: (context, index) {
              final match = cricketProvider.cricket[index];

              return Card(
                color: Colors.green.shade100,
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16),
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.network(
                      match.img,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text(
                    match.teamName,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                  ),
                  subtitle: Text('Tap to see players'),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PlayerListScreen(
                            players: match.players, teamName: match.teamName),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
