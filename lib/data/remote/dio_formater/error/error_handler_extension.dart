import 'package:dio/dio.dart';
import 'error_handler.dart';

extension ErrorHandlerExtension<T> on Future<T> {
  // Handle error with option to show message and rethrow
  Future<T?> handleError({
    bool showMessage = true,
    Function(String message, DioException error)? onError,
    bool rethrowError = true,
  }) async {
    try {
      return await this;
    } on DioException catch (e) {
      final message = ErrorHandler.getUserFriendlyMessage(e);
      if (showMessage) {
        ErrorHandler.handleErrorWithCallbacks(e);
      }
      onError?.call(message, e);
      if (rethrowError) {
        rethrow;
      }
      return null;
    } catch (e) {
      if (showMessage) {
        ErrorHandler.onShowMessage?.call('Terjadi kesalahan: ${e.toString()}');
      }
      onError?.call(
        e.toString(),
        DioException(
          requestOptions: RequestOptions(path: ''),
          message: e.toString(),
        ),
      );
      if (rethrowError) {
        rethrow;
      }
      return null;
    }
  }

  // Handle error silently without rethrowing
  Future<T?> handleErrorSilently({
    bool showMessage = true,
    Function(String message, DioException error)? onError,
  }) async {
    return handleError(
      showMessage: showMessage,
      onError: onError,
      rethrowError: false,
    );
  }
}
