import 'package:flutter/material.dart';
import 'package:ppob_koperasi_payment/feature/pulsa/widgets/history_phone.dart';
import 'package:ppob_koperasi_payment/feature/pulsa/widgets/product_item_prepaid.dart';
import 'package:ppob_koperasi_payment/utils/widgets/custom_divider_text.dart';
import 'package:ppob_koperasi_payment/utils/widgets/custom_text_field.dart';
import 'package:ppob_koperasi_payment/utils/widgets/primary_appbar.dart';

class PulsaPage extends StatelessWidget {
  const PulsaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PrimaryAppBar(title: 'Pulsa', showBackButton: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: Column(
          children: [
            Row(
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
            const SizedBox(height: 16.0),
            CustomTextField(
              name: 'pulsa_phone_number',
              hint: 'Masukkan nomor telepon',
              keyboardType: TextInputType.number,
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
