import 'package:dio/dio.dart';
import 'package:ppob_koperasi_payment/data/local_storage/storage_manager.dart';
import 'dio_formater/interceptors/dio_interceptors.dart';

class DioInitializer {
  static Dio? _dio;

  static Dio get dio {
    if (_dio == null) {
      _dio = Dio(
        BaseOptions(
          baseUrl: 'https://your-api-base-url.com',
          connectTimeout: const Duration(seconds: 30),
          receiveTimeout: const Duration(seconds: 30),
          headers: {'Content-Type': 'application/json'},
        ),
      );
      _dio!.interceptors.add(DioInterceptors.logging);
      _dio!.interceptors.add(DioInterceptors.errorHandler);
    }
    return _dio!;
  }

  Future<Options> _buildOptions({
    int sendTimeout = 60000,
    int receiveTimeout = 60000,
  }) async {
    final Map<String, dynamic> newHeaders = {'Accept': 'application/json'};

    newHeaders.addAll({});
    final token =
        await StorageManager.read<String>('token', isSecure: true) ?? "";
    final xTokenPin =
        await StorageManager.read<String>('xTokenPin', isSecure: true) ?? "";

    if (token.isNotEmpty) {
      newHeaders["Authorization"] = "Bearer $token";
    }
    if (xTokenPin.isNotEmpty) {
      newHeaders["xTokenPin"] = xTokenPin;
    }

    return Options(
      headers: newHeaders,
      sendTimeout: Duration(milliseconds: sendTimeout),
      receiveTimeout: Duration(milliseconds: receiveTimeout),
    );
  }

  Future<T> get<T>({
    required String url,
    required T Function(Map<String, dynamic>) parser,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final options = await _buildOptions();
      final response = await dio.get(
        url,
        queryParameters: queryParameters,
        options: options,
      );
      return parser(response.data ?? {});
    } catch (e) {
      rethrow;
    }
  }

  Future<T> post<T>({
    required String url,
    required T Function(Map<String, dynamic>) parser,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final options = await _buildOptions();
      final response = await dio.post(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
      return parser(response.data ?? {});
    } catch (e) {
      rethrow;
    }
  }
}
