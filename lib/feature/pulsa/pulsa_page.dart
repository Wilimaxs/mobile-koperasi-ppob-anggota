import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ppob_koperasi_payment/feature/pulsa/pulsa_controller.dart';
import 'package:ppob_koperasi_payment/feature/pulsa/widgets/history_phone.dart';
import 'package:ppob_koperasi_payment/feature/pulsa/widgets/product_item_prepaid.dart';
import 'package:ppob_koperasi_payment/utils/widgets/custom_divider_text.dart';
import 'package:ppob_koperasi_payment/utils/widgets/custom_text_field.dart';
import 'package:ppob_koperasi_payment/utils/widgets/primary_appbar.dart';

class PulsaPage extends GetView<PulsaController> {
  const PulsaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PrimaryAppBar(title: 'Pulsa', showBackButton: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: Column(
          children: [
            Obx(() {
              return AnimatedOpacity(
                opacity: controller.phoneNumber.value.length >= 4 ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 300),
                child: Row(
                  children: [
                    Icon(
                      Icons.telegram,
                      size: 32,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Telkomsel',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                  ],
                ),
              );
            }),
            const SizedBox(height: 16.0),
            CustomTextField(
              name: 'pulsa_phone_number',
              hint: 'Masukkan nomor telepon',
              keyboardType: TextInputType.number,
              onChanged: controller.onPhoneChanged,
              suffixIcon: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.contact_phone),
              ),
            ),
            const SizedBox(height: 16.0),
            const HistoryPhone(),
            const SizedBox(height: 16.0),
            const CustomDividerText(text: 'Pilih Paket Pulsa'),
            const SizedBox(height: 16.0),
            const ProductItemPrepaid(),
          ],
        ),
      ),
    );
  }
}
