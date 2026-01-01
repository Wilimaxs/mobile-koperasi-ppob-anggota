import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ppob_koperasi_payment/feature/bottom_confirmation/bottom_confirmation_controller.dart';
import 'package:ppob_koperasi_payment/feature/bottom_confirmation/widgets/info_item.dart';
import 'package:ppob_koperasi_payment/utils/theme/app_color.dart';
import 'package:ppob_koperasi_payment/utils/widgets/primary_button.dart';

class BottomConfirmationPage extends GetView<BottomConfirmationController> {
  const BottomConfirmationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 50,
              height: 5,
              decoration: BoxDecoration(
                color: AppColors.text40,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          const SizedBox(height: 24),

          // Icon dan Nama Provider (Tengah)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.signal_cellular_alt_rounded,
                color: Colors.red, // Dummy color for provider icon
                size: 24,
              ),
              const SizedBox(width: 8),
              Text(
                'TELKOMSEL',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Divider(thickness: 1, color: AppColors.text40),
          const SizedBox(height: 16),
          Text(
            'Informasi Produk',
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),

          // Daftar Informasi (Hardcoded Dummy)
          InfoItem(
            label: 'ID Produk',
            value: controller.data.value?.productCode ?? '-',
          ),
          InfoItem(
            label: 'Nama Produk',
            value: controller.data.value?.productName ?? '-',
          ),
          const InfoItem(label: 'Nomor Telepon', value: "081323232"),
          InfoItem(
            label: 'Status',
            value: (controller.data.value?.status ?? false)
                ? 'Tersedia'
                : 'Habis',
            valueColor: Colors.green,
          ),
          InfoItem(label: 'Harga', value: 'Rp ${controller.data.value?.price}'),

          const SizedBox(height: 16),
          // Deskripsi
          Text('Deskripsi', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          Text(
            controller.data.value?.description ?? "no description",
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: AppColors.text50,
              height: 1.5,
            ),
          ),

          const SizedBox(height: 32),

          // Action Button
          PrimaryButton(text: 'Konfirmasi', onPressed: () {}),
          const SizedBox(height: 12),
          PrimaryButton(
            text: 'Batal',
            reverse: true,
            textColor: Colors.red,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
