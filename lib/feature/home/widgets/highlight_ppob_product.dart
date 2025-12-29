import 'package:flutter/material.dart';
import 'package:ppob_koperasi_payment/utils/theme/app_color.dart';
import 'package:ppob_koperasi_payment/utils/widgets/custom_text_field.dart';

class HighlightPpobProduct extends StatelessWidget {
  const HighlightPpobProduct({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> products = [
      {'icon': Icons.phone_android, 'label': 'Pulsa'},
      {'icon': Icons.bolt, 'label': 'Listrik'},
      {'icon': Icons.water_drop, 'label': 'PDAM'},
      {'icon': Icons.tv, 'label': 'Internet'},
      {'icon': Icons.health_and_safety, 'label': 'BPJS'},
      {'icon': Icons.games, 'label': 'Games'},
      {'icon': Icons.receipt_long, 'label': 'Tagihan'},
      {'icon': Icons.more_horiz, 'label': 'Lainnya'},
    ];

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
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: products.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              childAspectRatio: 0.85,
            ),
            itemBuilder: (context, index) {
              final product = products[index];
              return _buildProductItem(
                context,
                icon: product['icon'],
                label: product['label'],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildProductItem(
    BuildContext context, {
    required IconData icon,
    required String label,
  }) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.primaryContainerLight,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: AppColors.primaryLight, size: 28),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            fontWeight: FontWeight.w500,
            color: AppColors.text90,
          ),
        ),
      ],
    );
  }
}
