import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ppob_koperasi_payment/data/base/base_controller.dart';
import 'package:ppob_koperasi_payment/model/user_balance.dart';

class HomeController extends BaseController<UserBalance> {
  final isVisibleBalance = false.obs;

  @override
  void onInit() {
    super.onInit();
    getBalanceUser();
  }

  Future<void> getBalanceUser() async {
    try {
      setLoading(true);
      final response =  await apiService.getBalance();
      data.value = response.data;
    } catch (e) {
      debugPrint("Login Error: $e");
      showError(e);
    } finally {
      setLoading(false);
    }
  }
}
