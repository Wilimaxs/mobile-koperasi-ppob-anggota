import 'package:flutter/material.dart';
import 'package:ppob_koperasi_payment/feature/home/widgets/balance_card.dart';
import 'package:ppob_koperasi_payment/feature/home/widgets/greeting_welcome.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 10),
          child: Column(
            children: [
              GreetingWelcome(),
              SizedBox(height: 24),
              BalanceCard(),
            ],
          ),
        ),
      ),
    );
  }
}
