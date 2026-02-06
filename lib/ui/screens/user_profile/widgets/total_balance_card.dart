
// SALDO TOTAL CARD

import 'package:flutter/material.dart';

class TotalBalance extends StatelessWidget {
  final double totalBalance;
  final String currencySymbol;

  const TotalBalance({
    super.key, 
    required this.totalBalance,
    this.currencySymbol = 'S/.',
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Saldo Total',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.account_balance_wallet, color: Colors.blue, size: 28),
                const SizedBox(width: 8),
                Text(
                  '$currencySymbol ${totalBalance.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 24, 
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ],
        )
      ),
    );
  }
}