import 'package:flutter/material.dart';
import 'package:ppob_koperasi_payment/utils/theme/app_color.dart';
import 'package:ppob_koperasi_payment/utils/widgets/primary_button.dart';

class BalanceCard extends StatelessWidget {
  const BalanceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: AppColors.primaryLight,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    'Active Balance',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.white
                    )
                  ),
                  const SizedBox(width: 8),
                  const Icon(
                    Icons.visibility_off_outlined,
                    color: AppColors.white,
                    size: 18,
                  ),
                ],
              ),
              InkWell(
                onTap: () {
                  // action history
                },
                child: Row(
                  children: [
                    Text(
                        'History',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppColors.white,
                        )
                    ),
                    const SizedBox(width: 4),
                    const Icon(
                      Icons.chevron_right,
                      color: AppColors.white,
                      size: 18,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            'Rp 12.000.000',
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
              color: AppColors.white,
            )
          ),
          const SizedBox(height: 16),
          const Divider(
            color: AppColors.white,
            thickness: 0.5,
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: PrimaryButton(
                  text: 'Top Up',
                  onPressed: () {},
                  reverse: true,
                  height: 40,
                  radius: 20,
                  textColor: AppColors.primaryLight,
                  icon: const Icon(Icons.add_circle_outline, size: 18),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: PrimaryButton(
                  text: 'Transfer',
                  onPressed: () {},
                  reverse: true,
                  height: 40,
                  radius: 20,
                  textColor: AppColors.primaryLight,
                  icon: const Icon(Icons.send_outlined, size: 18),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}