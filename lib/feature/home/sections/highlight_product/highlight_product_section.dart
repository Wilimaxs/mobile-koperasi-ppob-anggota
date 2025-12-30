import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ppob_koperasi_payment/feature/home/sections/highlight_product/highlight_product_controller.dart';
import 'package:ppob_koperasi_payment/feature/home/sections/highlight_product/widgets/product_item.dart';
import 'package:ppob_koperasi_payment/feature/home/sections/highlight_product/widgets/shimmer_loading.dart';
import 'package:ppob_koperasi_payment/utils/theme/app_color.dart';
import 'package:ppob_koperasi_payment/utils/widgets/custom_text_field.dart';
import 'package:ppob_koperasi_payment/utils/widgets/state_handle.dart';

class HighlightPpobProduct extends GetView<HighlightProductController> {
  const HighlightPpobProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomTextField(
            name: 'search_product',
            hint: 'Cari produk layanan...',
            prefixIcon: Icon(Icons.search, color: AppColors.text50),
          ),
          const SizedBox(height: 20),

          Obx(
            () => StateHandle(
              isLoading: controller.isLoading.value,
              isError: controller.isError.value,
              isEmpty: controller.isEmpty.value,
              loadingWidget: const ShimmerLoading(),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: (controller.data.value?.length ?? 0) + 1,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  childAspectRatio: 0.85,
                ),
                itemBuilder: (context, index) {
                  final list = controller.data.value ?? [];
                  if (index == list.length) {
                    return const ProductItem(label: 'Lainnya', isMore: true);
                  }
                  return ProductItem(
                    iconUrl: list[index].iconUrl,
                    label: list[index].displayName ?? '',
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
