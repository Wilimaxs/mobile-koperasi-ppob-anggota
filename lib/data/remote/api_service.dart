// import 'dio_initializer.dart';
// import 'api_response.dart';

class ApiService {
  // final DioInitializer _dioInitializer = DioInitializer();

  // Contoh GET Object - return ApiResponse<Model>
  // Future<ApiResponse<User>> getUser(String userId) =>
  //     _dioInitializer.get(
  //       url: '/users/$userId',
  //       parser: (json) => ApiResponse.fromJson(json, (data) => User.fromJson(data)),
  //     );

  // Contoh GET List - return ApiResponseList<Model>
  // Future<ApiResponseList<Product>> getProducts() =>
  //     _dioInitializer.get(
  //       url: '/products',
  //       parser: (json) => ApiResponseList.fromJson(json, (data) => Product.fromJson(data)),
  //     );

  // Contoh POST Object - return ApiResponse<Model>
  // Future<ApiResponse<User>> createUser(Map<String, dynamic> userData) =>
  //     _dioInitializer.post(
  //       url: '/users',
  //       parser: (json) => ApiResponse.fromJson(json, (data) => User.fromJson(data)),
  //       data: userData,
  //     );

  // Contoh POST List - return ApiResponseList<Model>
  // Future<ApiResponseList<Product>> searchProducts(Map<String, dynamic> filter) =>
  //     _dioInitializer.post(
  //       url: '/products/search',
  //       parser: (json) => ApiResponseList.fromJson(json, (data) => Product.fromJson(data)),
  //       data: filter,
  //     );

  // Contoh dengan query parameters
  // Future<ApiResponse<User>> getUserWithParams(String userId) =>
  //     _dioInitializer.get(
  //       url: '/users/$userId',
  //       parser: (json) => ApiResponse.fromJson(json, (data) => User.fromJson(data)),
  //       queryParameters: {'include': 'profile'},
  //     );
}
