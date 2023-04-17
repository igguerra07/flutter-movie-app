import 'package:movie_app/src/infra/api/api_response.dart';

abstract class ApiClient {
  Future<ApiResponse> get({
    required String path,
    Map<String, dynamic> queryParams = const {},
  });
}
