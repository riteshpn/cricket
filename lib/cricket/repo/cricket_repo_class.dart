// api_service.dart

import 'package:cricket/cricket/model/data_model.dart/cricket_data_model.dart';

abstract class IApiService {
  Future<ApiResponse> fetchTeamDetails();
}