import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ppob_koperasi_payment/data/dialogMixin/dialog_mixin.dart';
import 'package:ppob_koperasi_payment/data/local_storage/storage_manager.dart';
import 'package:ppob_koperasi_payment/data/remote/api_service.dart';
import 'package:ppob_koperasi_payment/data/remote/error/error_handler.dart';

abstract class BaseController<T> extends GetxController with DialogMixin {
  final ApiService apiService = Get.find<ApiService>();
  final isLoading = false.obs;
  final isRefreshing = false.obs;
  final isEmpty = false.obs;
  final isError = false.obs;
  final cancelToken = CancelToken();

  final data = Rxn<T>();

  final storage = StorageManager();

  void setLoading(bool value) => isLoading.value = value;

  void setEmpty(bool value) => isEmpty.value = value;

  void setError(bool value) => isError.value = value;

  void hideKeyboard() {
    final context = Get.context;
    if (context != null) FocusScope.of(context).unfocus();
  }

  Future<void> onRefresh() async {
    isRefreshing.value = true;
    await fetchData();
    isRefreshing.value = false;
  }

  Future<void> fetchData() async {}

  Future<void> saveLocal(
    String key,
    dynamic value, {
    bool isSecure = false,
  }) async {
    await StorageManager.save(key, value, isSecure: isSecure);
  }

  Future<E?> readLocal<E>(String key, {bool isSecure = false}) async {
    return await StorageManager.read<E>(key, isSecure: isSecure);
  }

  @override
  void onClose() {
    data.value = null;
    if (!cancelToken.isCancelled) {
      cancelToken.cancel("Controller closed");
    }
    super.onClose();
  }

  void showError(dynamic message, {bool isRaw = false}) {
    String finalMessage;

    if (isRaw) {
      finalMessage = message.toString();
    } else if (message is dio.DioException) {
      finalMessage = ErrorHandler.getUserFriendlyMessage(message);
      ErrorHandler.handleAction(message.response?.statusCode);
    } else {
      finalMessage = message.toString();
    }
    showErrorSnackbar(finalMessage);
  }
}
