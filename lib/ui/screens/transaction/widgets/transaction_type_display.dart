import 'package:flutter/material.dart';

// Gasto / Ingreso (ToggleButton)

enum TransactionType { income, expense }

/// Botones segmentados para elegir entre Ingreso o Gasto
class TransactionTypeToggle extends StatelessWidget {
  final TransactionType initialType;
  final ValueChanged<TransactionType> onTypeChanged;

  const TransactionTypeToggle({
    super.key,
    this.initialType = TransactionType.expense,
    required this.onTypeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      isSelected: [
        initialType == TransactionType.income,
        initialType == TransactionType.expense,
      ],
      onPressed: (int index) {
        final newType = index == 0 ? TransactionType.income : TransactionType.expense;
        onTypeChanged(newType);
      },
      borderRadius: BorderRadius.circular(8),
      borderColor: Colors.blue,
      selectedBorderColor: Colors.blue,
      fillColor: Colors.blue.withOpacity(0.1),
      selectedColor: Colors.white,
      color: Colors.blue,
      constraints: const BoxConstraints(minWidth: 120, minHeight: 48),
      children: const [
        Text('Ingreso', style: TextStyle(fontWeight: FontWeight.bold)),
        Text('Gasto', style: TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }
}