import 'package:flutter/material.dart';

class Button extends StatelessWidget {

  final VoidCallback? onPressed;

  const Button({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Row(
          children: [
            const Icon(Icons.add, color: Colors.white),
            const SizedBox(width: 1),
            const Text(
              'Agregar Tarea',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ],
        ));
  }
}
