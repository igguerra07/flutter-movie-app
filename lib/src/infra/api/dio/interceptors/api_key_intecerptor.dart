import 'package:dio/dio.dart';

class ApiKeyInterceptor extends Interceptor {
  late final String apiKey;

  ApiKeyInterceptor({
    this.apiKey = "894df8957a9ce2cdac0b54ef990479f7",
  });

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    const apiKeyParam = "api_key";

    options.queryParameters.putIfAbsent(
      apiKeyParam,
      () => apiKey,
    );

    super.onRequest(options, handler);
  }
}
