import 'package:cricket/cricket/view/cricket_team_list.dart';
import 'package:cricket/cricket/view_model/cricket_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CricketProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CricketTeamListScreen(),
    );
  }
}
