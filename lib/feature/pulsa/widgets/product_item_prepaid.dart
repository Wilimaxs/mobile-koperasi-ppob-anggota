import 'package:flutter/material.dart';
import 'package:ppob_koperasi_payment/utils/theme/app_color.dart';
import 'package:ppob_koperasi_payment/utils/widgets/primary_button.dart';

class ProductItemPrepaid extends StatelessWidget {
  const ProductItemPrepaid({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 1.2,
        ),
        itemCount: 5,
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 7,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Pulsa 50.000',
                      style: Theme.of(context).textTheme.titleLarge,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    const Divider(
                      color: AppColors.text50,
                      thickness: 0.5,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Rp 50.500',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                    const SizedBox(height: 12),
                    PrimaryButton(
                      text: 'purchase',
                      height: 42,
                      onPressed: () {
                        // Handle purchase action
                      },
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
