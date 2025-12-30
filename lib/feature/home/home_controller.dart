import 'package:get/get.dart';
import 'package:ppob_koperasi_payment/data/base/base_controller.dart';
import 'package:ppob_koperasi_payment/model/user.dart';

class HomeController extends BaseController {
  final user = Rxn<User>();

  @override
  void onInit() {
    super.onInit();
    _loadUser();
  }

  void _loadUser() async {
    user.value = await getUserLocal();
  }
}
