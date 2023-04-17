import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../dio/dio_error_handler.dart';
import '../api_client.dart';
import '../api_response.dart';

class DioClient implements ApiClient {
  late final Dio _dio;

  DioClient({
    required Dio dio,
    String baseUrl = "https://api.themoviedb.org/3/",
    List<Interceptor>? interceptors,
  }) {
    _dio = _setup(
      dio: dio,
      baseUrl: baseUrl,
      interceptors: interceptors,
    );
  }

  Dio _setup({
    required Dio dio,
    required String baseUrl,
    List<Interceptor>? interceptors,
  }) {
    dio.options.baseUrl = baseUrl;

    dio.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'charset': 'utf-8',
    };

    if (interceptors != null) {
      dio.interceptors.addAll(interceptors);
    }

    if (kDebugMode) {
      final logInterceptor = LogInterceptor(
        requestBody: true,
        responseBody: true,
      );

      dio.interceptors.add(logInterceptor);
    }

    return dio;
  }

  @override
  Future<ApiResponse> get({
    required String path,
    Map<String, dynamic> queryParams = const {},
  }) async {
    try {
      final response = await _dio.get(
        path,
        queryParameters: queryParams,
      );
      return ApiResponse(
        data: response.data,
        statusCode: response.statusCode,
      );
    } on DioError catch (dioError) {
      throw dioError.mapToApiError();
    }
  }
}
