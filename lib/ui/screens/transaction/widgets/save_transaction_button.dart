import 'package:flutter/material.dart';

// "Guardar Transacción"
class SaveTransactionButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isEnabled;

  const SaveTransactionButton({
    super.key,
    required this.onPressed,
    this.isEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: isEnabled ? onPressed : null, // null = deshabilitado
      icon: const Icon(Icons.check, size: 18),
      label: const Text('Guardar Transacción'),
      style: ElevatedButton.styleFrom(
        backgroundColor: isEnabled ? Colors.blue : Colors.grey,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}