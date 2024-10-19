import 'package:flutter/material.dart';

enum TextStyleType {
  teamStyle,
  playernameStyle,
  roleStyle,
  battingStyle,
  bowlingStyle,
  countryStyle
}

extension TextStyleTypeExtension on TextStyleType {
  FontWeight get getFontWeight {
    switch (this) {
      case TextStyleType.playernameStyle:
        return FontWeight.bold;
      case TextStyleType.roleStyle:
        return FontWeight.bold;
      case TextStyleType.bowlingStyle:
        return FontWeight.bold;
      case TextStyleType.battingStyle:
        return FontWeight.bold;
      case TextStyleType.countryStyle:
        return FontWeight.bold;
      default:
        return FontWeight.bold;
    }
  }

  double get getFontsize {
    switch (this) {
      case TextStyleType.playernameStyle:
        return 20.0;
      case TextStyleType.roleStyle ||
            TextStyleType.bowlingStyle ||
            TextStyleType.battingStyle ||
            TextStyleType.countryStyle:
        return 15.0;

      default:
        return 18.0;
    }
  }

  Color get getFontColor {
    switch (this) {
      case TextStyleType.playernameStyle:
        return Colors.black;
      case TextStyleType.roleStyle ||
            TextStyleType.bowlingStyle ||
            TextStyleType.battingStyle ||
            TextStyleType.countryStyle:
        return Colors.white;

      default:
        return Colors.green;
    }
  }
}


//icon extension for according to player role
enum IconeNameType {
  sportbatting,
  sportbowling,
  sportcricket,
  sportflag,
}

extension IconeNameTypeExtension on IconeNameType {
  IconData get iconName {
    switch (this) {
      case IconeNameType.sportcricket:
        return Icons.sports_cricket;
      case IconeNameType.sportbatting:
        return Icons.sports_baseball;
      case IconeNameType.sportbowling:
        return Icons.sports_tennis;
      case IconeNameType.sportflag:
        return  Icons.flag;

      default:
        return Icons.wrap_text;
    }
  }

  Color get getIconColor {
    switch (this) {
      case IconeNameType.sportbatting ||
            IconeNameType.sportbatting ||
            IconeNameType.sportcricket ||
            IconeNameType.sportflag:
        return Colors.white;
         default:
        return Colors.green;
    }
  }
}
