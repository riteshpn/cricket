// api_service_impl.dart
import 'dart:convert';

import 'package:cricket/cricket/model/data_model.dart/cricket_data_model.dart';
import 'package:cricket/cricket/repo/cricket_repo_class.dart';
import 'package:http/http.dart' as http;

class ApiServiceImpl implements IApiServiceCricketTeams {
  final String _url =
      "https://api.cricapi.com/v1/series_squad?apikey=74a1470c-536e-4031-be51-071779827df0&id=75e7d04b-267a-4e76-9f5a-5cbbf4f4a983";

  @override
  Future<CricketApiResponce> fetchTeamDetails() async {
    final response = await http.get(Uri.parse(_url));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return CricketApiResponce.fromJson(data);
    } else {
      throw Exception('Failed to load team details');
    }
  }
}
