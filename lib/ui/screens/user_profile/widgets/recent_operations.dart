import 'package:finovate_mobile/ui/core/models/transaction.dart';
import 'package:flutter/material.dart';

// Operaciones Recientes
// Operaciones de gastos e ingresos del usuario
class RecentOperations extends StatelessWidget {
  //Monto neto actual
  final double netAmount; 
  final String currencySymbol;

  const RecentOperations({
    super.key,
    this.netAmount = 0.0,
    this.currencySymbol = 'S/',
  });

  Color get _color => netAmount >= 0 ? Colors.green : Colors.red;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        color: Colors.grey[50],
        shape: BoxShape.circle,
        border: Border.all(color: _color, width: 2),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              netAmount >= 0 ? '+' : '',
              style: TextStyle(color: _color, fontSize: 12),
            ),
            Text(
              '$currencySymbol${netAmount.abs().toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: _color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}