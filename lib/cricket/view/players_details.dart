import 'package:cricket/cricket/enum/enum_player_details_text_style.dart';
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
                child: CustomCircleAvtar(player.image),
              ),
              const SizedBox(height: 20),
              Text(player.name,
                  style: TextStyle(
                    fontSize: TextStyleType.playernameStyle.getFontsize,
                    color: TextStyleType.playernameStyle.getFontColor,
                    fontWeight: TextStyleType.playernameStyle.getFontWeight,
                  )),
              const SizedBox(height: 20),
              CardCustomWidget(player.role, player.bowlingStyle,
                  player.battingStyle, player.country),
            ],
          ),
        ),
      ),
    );
  }

  Widget CustomCircleAvtar(String image) {
    return CircleAvatar(
      radius: 50,
      backgroundImage: NetworkImage(image),
      backgroundColor: Colors.grey[300],
    );
  }

  Widget CardCustomWidget(
      role, String batting, String bowling, String country) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: const LinearGradient(colors: [
            Colors.green,
            Colors.greenAccent,
          ], begin: Alignment.bottomRight, end: Alignment.bottomRight),
        ),
        padding: const EdgeInsets.all(16.0),
        child: TextCustomWidget(
          role,
          batting,
          bowling,
          country,
        ),
      ),
    );
  }

  Widget TextCustomWidget(
      String role, String batting, String bowling, String country) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(IconeNameType.sportcricket.iconName,
                color: IconeNameType.sportcricket.getIconColor),
            const SizedBox(width: 10),
            Text(
              role,
              style: TextStyle(
                fontSize: TextStyleType.roleStyle.getFontsize,
                color: TextStyleType.roleStyle.getFontColor,
                fontWeight: TextStyleType.roleStyle.getFontWeight,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Icon(IconeNameType.sportbatting.iconName,
                color: IconeNameType.sportbatting.getIconColor),
            const SizedBox(width: 10),
            Text(
              batting,
              style: TextStyle(
                fontSize: TextStyleType.battingStyle.getFontsize,
                color: TextStyleType.battingStyle.getFontColor,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Icon(IconeNameType.sportbowling.iconName,
                color: IconeNameType.sportbowling.getIconColor),
            SizedBox(width: 10),
            Text(
              bowling,
              style: TextStyle(
                fontSize: TextStyleType.battingStyle.getFontsize,
                color: TextStyleType.battingStyle.getFontColor,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Icon(IconeNameType.sportflag.iconName,
                color: IconeNameType.sportflag.getIconColor),
            const SizedBox(width: 10),
            Text(
              country,
              style: TextStyle(
                fontSize: TextStyleType.countryStyle.getFontsize,
                color: TextStyleType.countryStyle.getFontColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
