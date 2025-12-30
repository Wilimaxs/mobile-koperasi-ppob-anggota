import 'package:flutter/material.dart';
import 'package:ppob_koperasi_payment/feature/home/widgets/balance_card.dart';
import 'package:ppob_koperasi_payment/feature/home/widgets/greeting_welcome.dart';
import 'package:ppob_koperasi_payment/feature/home/sections/highlight_product/highlight_product_section.dart';
import 'package:ppob_koperasi_payment/feature/home/widgets/news_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 10),
            child: Column(
              children: [
                GreetingWelcome(),
                SizedBox(height: 16),
                BalanceCard(),
                SizedBox(height: 24),
                HighlightPpobProduct(),
                SizedBox(height: 24),
                NewsSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
