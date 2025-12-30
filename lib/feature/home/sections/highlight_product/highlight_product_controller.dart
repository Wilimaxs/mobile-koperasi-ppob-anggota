import 'package:ppob_koperasi_payment/data/base/base_controller.dart';
import 'package:ppob_koperasi_payment/data/remote/extention_api_service.dart';
import 'package:ppob_koperasi_payment/model/product_category.dart';

class HighlightProductController extends BaseController<List<ProductCategory>> {
  @override
  void onInit() {
    super.onInit();
    getHighlightProducts();
  }

  Future<void> getHighlightProducts() async {
    try {
      setLoading(true);
      setError(false);
      setEmpty(false);
      final response = await apiService.getHighlightProduct().validateResponse;
      data.value = response;
      if (response.isEmpty) {
        setEmpty(true);
      }
    } catch (e) {
      setError(true);
      showError(e);
    } finally {
      setLoading(false);
    }
  }
}
