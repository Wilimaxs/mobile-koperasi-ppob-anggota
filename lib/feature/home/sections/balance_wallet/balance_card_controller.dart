import 'package:get/get.dart';
import 'package:ppob_koperasi_payment/data/base/base_controller.dart';
import 'package:ppob_koperasi_payment/data/remote/extention_api_service.dart';
import 'package:ppob_koperasi_payment/model/user_balance.dart';

class BalanceCardController extends BaseController<UserBalance> {
  final isVisibleBalance = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  @override
  Future<void> fetchData() async {
    try {
      if (!isRefreshing.value) setLoading(true);
      final response = await apiService.getBalance().validateResponse;
      data.value = response;
    } catch (e) {
      showError(e);
    } finally {
      setLoading(false);
    }
  }
}
