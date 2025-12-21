import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../error/error_handler.dart';

class DioInterceptors {
  static InterceptorsWrapper get logging => InterceptorsWrapper(
    // Log request details
    onRequest: (options, handler) {
      debugPrint('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
      debugPrint('REQUEST: ${options.method} ${options.path}');
      debugPrint('Headers: ${options.headers}');
      if (options.queryParameters.isNotEmpty) {
        debugPrint('Query: ${options.queryParameters}');
      }
      if (options.data != null) {
        debugPrint('Body: ${options.data}');
      }
      debugPrint('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
      return handler.next(options);
    },

    // Log response details
    onResponse: (response, handler) {
      final statusCode = response.statusCode;
      final data = response.data;

      debugPrint('RESPONSE: $statusCode ${response.requestOptions.path}');
      if (data is Map<String, dynamic>) {
        final message = data['message']?.toString();
        debugPrint('Message: ${message ?? '(empty)'}');
      } else if (data is List) {
        debugPrint('Result: List with ${data.length} items');
      }

      debugPrint('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
      return handler.next(response);
    },

    // Log error details
    onError: (error, handler) {
      final statusCode = error.response?.statusCode;
      final data = error.response?.data;
      String? message;
      if (data is Map<String, dynamic>) {
        message = data['message'];
      }
      debugPrint('ERROR: $statusCode ${error.requestOptions.path}');
      debugPrint('Message: ${message ?? error.message}');
      if (data != null) {
        debugPrint('Error Data: $data');
      }
      debugPrint('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
      return handler.next(error);
    },
  );

  // Handle errors and perform actions based on status codes
  static InterceptorsWrapper get errorHandler => InterceptorsWrapper(
    onError: (error, handler) {
      final statusCode = error.response?.statusCode;
      final path = error.requestOptions.path;
      final errorMessage = ErrorHandler.getUserFriendlyMessage(error);

      // Logging Error details
      ErrorHandler.logError(
        statusCode: statusCode,
        path: path,
        message: errorMessage,
        data: error.response?.data,
      );

      // Handle specific status codes with actions
      if (ErrorHandler.isUnauthorized(statusCode)) {
        debugPrint('Action: Unauthorized detected');
        ErrorHandler.onUnauthorized?.call();
      } else if (ErrorHandler.isForbidden(statusCode)) {
        debugPrint('Action: Forbidden detected');
        ErrorHandler.onForbidden?.call();
      }

      ErrorHandler.onShowMessage?.call(errorMessage);

      return handler.next(error);
    },
  );
}
