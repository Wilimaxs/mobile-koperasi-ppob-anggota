import 'package:get/get.dart';
import 'package:ppob_koperasi_payment/data/dialogMixin/dialog_mixin.dart';

abstract class BaseController extends GetxController with DialogMixin {
  @override
  void onReady() {
    super.onReady();
    if (Get.context != null){
      setContext(Get.context!);
    }
  }

  // void _setupErrorHandlers() {
  //   ErrorHandler.onShowMessage = showErrorSnackbar;
  //   ErrorHandler.onUnauthorized = _handleUnauthorized;
  //   ErrorHandler.onForbidden = _handleForbidden;
  // }

}