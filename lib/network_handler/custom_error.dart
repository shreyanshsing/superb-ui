class CustomNetworkError extends Error {
  final String message;
  final int? statusCode;

  CustomNetworkError({required this.message, this.statusCode = 500});

  factory CustomNetworkError.fromJson(Map<String, dynamic> json) {
    return CustomNetworkError(
      message: json['message'],
      statusCode: json['statusCode'],
    );
  }
}
