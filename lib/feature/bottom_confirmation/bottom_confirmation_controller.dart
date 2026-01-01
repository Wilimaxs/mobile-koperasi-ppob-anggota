import 'package:ppob_koperasi_payment/data/base/base_controller.dart';
import 'package:ppob_koperasi_payment/model/prepaid_product.dart';

class BottomConfirmationController extends BaseController<PrepaidProduct> {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    data.value = PrepaidProduct(
      productCode: 'PLSA-50K',
      productName: 'Pulsa 50.000',
      price: '50500',
      description:
          'Pengisian pulsa prabayar nominal 50.000. Berlaku untuk semua nomor Telkomsel prabayar. Masa aktif akan bertambah mengikuti skema provider.',
      status: true,
    );
  }
}
