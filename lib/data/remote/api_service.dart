import 'api_response.dart';
import 'dio_initializer.dart';

class ApiService {
  final DioInitializer _dio;

  ApiService(this._dio);

  // Example of a specific API call method (login)
  Future<ApiResponse<String>> login({
    required String username,
    required String password,
  }) async {
    return await _dio.post(
      url: '/auth/login',
      data: {'username': username, 'password': password},
      parser: (json) =>
          ApiResponse<String>.fromJson(json, (data) => data.toString()),
    );
  }

  // Example of a specific API call method (get products)
  Future<ApiResponseList<T>> getProducts<T>({
    required T Function(Map<String, dynamic>) modelParser,
  }) async {
    return await _dio.get(
      url: '/products',
      parser: (json) => ApiResponseList<T>.fromJson(json, modelParser),
    );
  }
}
