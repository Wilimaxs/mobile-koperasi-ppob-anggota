import 'package:get/get.dart';
import 'package:ppob_koperasi_payment/feature/home/home_controller.dart';
import 'package:ppob_koperasi_payment/feature/home/sections/balance_wallet/balance_card_controller.dart';
import 'package:ppob_koperasi_payment/feature/home/sections/highlight_product/highlight_product_controller.dart';

import 'bottom_navigation_controller.dart';

class BottomNavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BottomNavigationController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => HighlightProductController());
    Get.lazyPut(() => BalanceCardController());
  }
}
