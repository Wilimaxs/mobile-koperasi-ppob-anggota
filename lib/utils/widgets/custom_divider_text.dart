import 'package:flutter/material.dart';
import 'package:ppob_koperasi_payment/utils/theme/app_color.dart';

class CustomDividerText extends StatelessWidget {
  const CustomDividerText({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider(thickness: 1, color: AppColors.text50)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            text,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: AppColors.text50),
          ),
        ),
        const Expanded(child: Divider(thickness: 1, color: AppColors.text50)),
      ],
    );
  }
}
