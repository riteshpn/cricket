import 'dart:convert';
import 'package:flutter/foundation.dart' show debugPrint;

// Define a class
class User {
  final String name;
  final int age;
  final bool isMarried;

  User(this.name, this.age, this.isMarried);

  // Define a toJson method to convert User object to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'age': age,
      "isMarried": isMarried,
    };
  }
}

