import 'base_controller.dart';
import 'package:get/get.dart';

abstract class PaginationController<T> extends BaseController<T> {
  final listData = <T>[].obs;

  final page = 1.obs;
  final isLastPage = false.obs;

  @override
  Future<void> onRefresh() async {
    page.value = 1;
    isLastPage.value = false;
    listData.clear();
    await super.onRefresh();
  }


  Future<void> loadNextPage() async {
    if (isLastPage.value || isLoading.value) return;

    page.value++;
    await fetchData();
  }

  @override
  void onClose() {
    listData.clear();
    super.onClose();
  }
}