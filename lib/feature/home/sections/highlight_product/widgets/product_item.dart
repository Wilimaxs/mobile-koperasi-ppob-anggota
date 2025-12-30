import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ppob_koperasi_payment/utils/theme/app_color.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    this.iconUrl,
    required this.label,
    this.isMore,
  });

  final String? iconUrl;
  final String label;
  final bool? isMore;

  @override
  Widget build(BuildContext context) {
    final bool more = isMore ?? false;
    final bool hasNoIcon = iconUrl == null || iconUrl!.isEmpty;
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.primaryContainerLight,
            borderRadius: BorderRadius.circular(12),
          ),
          child: more
              ? const Icon(
                  Icons.more_horiz,
                  color: AppColors.primaryLight,
                  size: 28,
                )
              : hasNoIcon
              ? const Icon(
                  Icons.phone_android,
                  color: AppColors.primaryLight,
                  size: 28,
                )
              : SvgPicture.network(
                  iconUrl!,
                  width: 28,
                  height: 28,
                  placeholderBuilder: (context) => const SizedBox(
                    width: 28,
                    height: 28,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                ),
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
