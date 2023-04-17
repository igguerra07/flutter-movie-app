import 'package:dio/dio.dart';

import '../api_error.dart';

extension DioErrorHandler on DioError {
  Exception mapToApiError() {
    switch (type) {
      default:
        return ApiError(
          error: error,
          message: message,
          stackTrace: stackTrace,
        );
    }
  }
}
