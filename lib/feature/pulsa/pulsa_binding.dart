import 'package:get/get.dart';
import 'package:ppob_koperasi_payment/feature/pulsa/pulsa_controller.dart';

class PulsaBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<PulsaController>(PulsaController());
  }
}
