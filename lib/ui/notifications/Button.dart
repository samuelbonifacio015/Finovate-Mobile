import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final VoidCallback? onPressed;

  const Button({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      //Max width 
      constraints: const BoxConstraints(maxWidth: 200),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
          //Border radius
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: const Row(
          children: [
            SizedBox(width: 8),
            Expanded(
              child: Center(
                child: Text(
              'Ver Demostración ->',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
              )
            )
          ],
        ),
      ),
    );
  }
}
