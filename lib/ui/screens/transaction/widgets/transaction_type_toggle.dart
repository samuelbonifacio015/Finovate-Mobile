import 'package:flutter/material.dart';
import 'package:finovate_mobile/ui/screens/transaction/models/transaction.dart';

/// Toggle para seleccionar el tipo de transacción (Ingreso/Gasto)
class TransactionTypeToggle extends StatelessWidget {
  final TransactionType initialType;
  final ValueChanged<TransactionType> onTypeChanged;

  const TransactionTypeToggle({
    super.key,
    required this.initialType,
    required this.onTypeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Expanded(
            child: _TypeButton(
              label: 'Ingreso',
              icon: Icons.arrow_upward,
              color: Colors.green,
              isSelected: initialType == TransactionType.income,
              onTap: () => onTypeChanged(TransactionType.income),
            ),
          ),
          Expanded(
            child: _TypeButton(
              label: 'Gasto',
              icon: Icons.arrow_downward,
              color: Colors.red,
              isSelected: initialType == TransactionType.expense,
              onTap: () => onTypeChanged(TransactionType.expense),
            ),
          ),
        ],
      ),
    );
  }
}

class _TypeButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;
  final bool isSelected;
  final VoidCallback onTap;

  const _TypeButton({
    required this.label,
    required this.icon,
    required this.color,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? color.withOpacity(0.1) : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          border: isSelected ? Border.all(color: color, width: 2) : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: isSelected ? color : Colors.grey, size: 20),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? color : Colors.grey,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
