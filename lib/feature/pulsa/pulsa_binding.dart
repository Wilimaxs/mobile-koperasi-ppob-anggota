import 'package:get/get.dart';
import 'package:ppob_koperasi_payment/feature/bottom_confirmation/bottom_confirmation_controller.dart';
import 'package:ppob_koperasi_payment/feature/pulsa/pulsa_controller.dart';

class PulsaBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<PulsaController>(PulsaController());
    Get.lazyPut<BottomConfirmationController>(
      () => BottomConfirmationController(),
      fenix: true,
    );
  }
}
