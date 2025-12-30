import 'package:ppob_koperasi_payment/data/base/base_controller.dart';
import 'package:ppob_koperasi_payment/data/remote/extention_api_service.dart';
import 'package:ppob_koperasi_payment/model/product_category.dart';

class HighlightProductController extends BaseController<List<ProductCategory>> {
  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  @override
  Future<void> fetchData() async {
    try {
      if (!isRefreshing.value) setLoading(true);
      setError(false);
      setEmpty(false);
      final response = await apiService
          .getHighlightProduct(cancelToken: cancelToken)
          .validateResponse;
      data.value = response;
      setEmpty(response.isEmpty);
    } catch (e) {
      setError(true);
      showError(e);
    } finally {
      setLoading(false);
    }
  }
}
