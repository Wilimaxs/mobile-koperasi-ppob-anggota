import 'package:dio/dio.dart';
import 'package:ppob_koperasi_payment/model/user_balance.dart';
import 'package:ppob_koperasi_payment/model/login_response.dart';

import 'api_response.dart';
import 'dio_initializer.dart';

class ApiService {
  final DioInitializer _dio;

  ApiService(this._dio);

  // Login API
  Future<ApiResponse<LoginResponse>> login({
    required String email,
    required String password,
    CancelToken? cancelToken,
  }) async {
    return await _dio.post(
      url: '/auth/login',
      data: {'email': email, 'password': password},
      cancelToken: cancelToken,
      parser: (json) => ApiResponse<LoginResponse>.fromJson(
        json,
        (data) => LoginResponse.fromJson(data),
      ),
    );
  }

  // Balance User API
  Future<ApiResponse<UserBalance>> getBalance({
    CancelToken? cancelToken,
  }) async {
    return await _dio.get(
      url: '/payment/wallet/balance',
      cancelToken: cancelToken,
      parser: (json) => ApiResponse<UserBalance>.fromJson(
        json,
            (data) => UserBalance.fromJson(data),
      ),
    );
  }

}
