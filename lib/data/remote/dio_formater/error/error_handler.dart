import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ErrorHandler {
  static Function(String message)? onShowMessage;
  static Function()? onUnauthorized;
  static Function()? onForbidden;

  static void handleErrorWithCallbacks(DioException error) {
    final message = getUserFriendlyMessage(error);
    final statusCode = error.response?.statusCode;

    onShowMessage?.call(message);

    // Handle specific actions
    if (isUnauthorized(statusCode)) {
      onUnauthorized?.call();
    } else if (isForbidden(statusCode)) {
      onForbidden?.call();
    }
  }

  // Mapping status code ke error message
  static Map<int, String> _errorStatusCodeMapping() {
    return {
      400: 'Invalid request',
      401: 'Your session has expired, please login again',
      403: 'You do not have access to this resource',
      404: 'Data not found',
      405: 'Method not allowed',
      408: 'Request timeout, please try again',
      409: 'Data conflict occurred',
      410: 'Resource no longer available',
      422: 'The data you entered is invalid',
      429: 'Too many requests, please try again later',
      500: 'Server error occurred',
      501: 'Feature not available',
      502: 'Gateway server error',
      503: 'Service unavailable, please try again later',
      504: 'Server timeout, please try again',
      505: 'HTTP version not supported',
    };
  }

  // Get user friendly message from DioException and message API response
  static String getUserFriendlyMessage(DioException error) {
    final data = error.response?.data;
    if (data is Map<String, dynamic>) {
      final apiMessage = data['message']?.toString();
      if (apiMessage != null && apiMessage.isNotEmpty) {
        return apiMessage;
      }
    }

    // Handle Error by DioExceptionType
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return 'Connection to server timeout, Please try again';

      case DioExceptionType.sendTimeout:
        return 'Send request to server timeout, Please try again';

      case DioExceptionType.receiveTimeout:
        return 'Receive data from server timeout, Please try again';

      case DioExceptionType.badCertificate:
        return 'Certificate server not valid';

      case DioExceptionType.badResponse:
        final statusCode = error.response?.statusCode;
        final errorMessages = _errorStatusCodeMapping();
        return errorMessages[statusCode] ??
            'Something went wrong with status code $statusCode';

      case DioExceptionType.cancel:
        return 'Request was cancelled';

      case DioExceptionType.connectionError:
        return 'Connection error, please check your internet connection';

      case DioExceptionType.unknown:
        final errorMsg = error.message?.toLowerCase() ?? '';
        if (errorMsg.contains('socketexception') ||
            errorMsg.contains('handshake')) {
          return 'Connection error, please check your internet connection';
        }
        return 'Unexpected error occurred';
    }
  }

  // Logging error details
  static void logError({
    required int? statusCode,
    required String path,
    required String message,
    Map<String, dynamic>? data,
  }) {
    debugPrint('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
    debugPrint('ERROR DETAILS');
    debugPrint('Status Code: ${statusCode ?? 'N/A'}');
    debugPrint('Path: $path');
    debugPrint('Message: $message');
    if (data != null && data.isNotEmpty) {
      debugPrint('Data: $data');
    }
    debugPrint('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
  }

  /// Check apakah error adalah unauthorized (401)
  static bool isUnauthorized(int? statusCode) {
    return statusCode == 401;
  }

  /// Check apakah error adalah forbidden (403)
  static bool isForbidden(int? statusCode) {
    return statusCode == 403;
  }

  /// Check apakah error adalah not found (404)
  static bool isNotFound(int? statusCode) {
    return statusCode == 404;
  }

  /// Check apakah error adalah server error (5xx)
  static bool isServerError(int? statusCode) {
    return statusCode != null && statusCode >= 500 && statusCode < 600;
  }

  /// Check apakah error adalah client error (4xx)
  static bool isClientError(int? statusCode) {
    return statusCode != null && statusCode >= 400 && statusCode < 500;
  }

  /// Check apakah error adalah connection error
  static bool isConnectionError(DioException error) {
    return error.type == DioExceptionType.connectionError ||
        error.type == DioExceptionType.connectionTimeout ||
        (error.message?.contains('SocketException') ?? false);
  }
}
