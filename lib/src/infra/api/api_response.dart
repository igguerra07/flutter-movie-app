class ApiResponse {
  final int? statusCode;
  final dynamic data;

  ApiResponse({
    required this.data,
    this.statusCode
  });

  @override
  String toString() => "Response[$statusCode]: $data";
}
