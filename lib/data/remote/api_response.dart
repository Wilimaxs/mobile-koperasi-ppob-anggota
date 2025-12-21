import 'base_response.dart';

// Untuk response API yang mengembalikan object tunggal
class ApiResponse<T> extends BaseResponse<T> {
  final T? result;

  ApiResponse({
    required super.status,
    required super.message,
    this.result,
  });

  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>)? fromJsonT,
  ) {
    return ApiResponse(
      status: json['status'] ?? '',
      message: json['message'] ?? '',
      result: json['result'] != null && fromJsonT != null
          ? fromJsonT(json['result'] as Map<String, dynamic>)
          : null,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'result': result,
    };
  }
}

// Untuk response API yang mengembalikan list
class ApiResponseList<T> extends BaseResponse<T> {
  final List<T>? result;

  ApiResponseList({
    required super.status,
    required super.message,
    this.result,
  });

  factory ApiResponseList.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>)? fromJsonT,
  ) {
    return ApiResponseList(
      status: json['status'] ?? '',
      message: json['message'] ?? '',
      result: json['result'] != null && fromJsonT != null
          ? (json['result'] as List)
              .map((item) => fromJsonT(item as Map<String, dynamic>))
              .toList()
          : null,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'result': result,
    };
  }
}
