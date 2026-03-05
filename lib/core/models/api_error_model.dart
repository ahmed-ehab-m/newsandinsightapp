class ApiErrorModel {
  final String status;
  final String code;
  final String message;

  ApiErrorModel({
    required this.status,
    required this.code,
    required this.message,
  });

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) {
    return ApiErrorModel(
      status: json['status'] ?? 'error',
      code: json['code'] ?? 'unknown_error',
      message:
          json['message'] ?? 'An unexpected error occurred from the server.',
    );
  }
}
