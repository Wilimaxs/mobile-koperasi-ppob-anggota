import 'package:get/get.dart';
import 'package:ppob_koperasi_payment/data/base/base_controller.dart';

class PulsaController extends BaseController {
  var phoneNumber = ''.obs;

  void onPhoneChanged(String? value) {
    phoneNumber.value = value ?? '';
  }
}