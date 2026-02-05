
// SALDO TOTAL CARD

import 'package:flutter/material.dart';

class TotalBalance extends StatelessWidget {
  final double totalBalance;

  const TotalBalance({
    super.key, required this.totalBalance
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: const Icon(Icons.account_balance_wallet, size: 18),
      label: Text('Saldo Total: S/. ${totalBalance.toStringAsFixed(2)}'),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}