import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppob_koperasi_payment/gen/assets.gen.dart';
import 'package:ppob_koperasi_payment/utils/theme/app_color.dart';

class GreetingWelcome extends StatelessWidget {
  const GreetingWelcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Welcome, ',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              TextSpan(
                text: 'Wilimaxs',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ),
        Container(
          width: 34,
          height: 34,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.white,
            boxShadow: [
              BoxShadow(
                color: AppColors.text40,
                blurRadius: 2,
                offset: Offset(0, 1),
              ),
            ],
          ),
          child: IconButton(
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            onPressed: () {},
            icon: SvgPicture.asset(
              Assets.icons.icNotificationHome.path,
              width: 18,
              height: 18,
            )
          ),
        ),
      ],
    );
  }
}
