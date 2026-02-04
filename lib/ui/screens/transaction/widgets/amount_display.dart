import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// "0.00"

class AmountDisplay extends StatelessWidget {
  final double amount;

  /// En el caso de finovate será 'S/.'
  final String currencySymbol;

  const AmountDisplay({
    super.key,
    required this.amount,
    this.currencySymbol = 'S/.',
  });

  @override
  Widget build(BuildContext context) {
    //Formatea el numero con dos decimales ejm: 123.4 -> 123.40
    final formatter = NumberFormat("##0.00", "en_US");
    final formattedAmount = formatter.format(amount);

    return Column(
      children: [
        Text(
          currencySymbol,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          formattedAmount,
          style: const TextStyle(
            fontSize: 64,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
            height: 1.0,
          ),
        ),
      ]
    );
  }
}