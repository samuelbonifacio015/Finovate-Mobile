import 'package:flutter/material.dart';

// TextField con iconos y placeholder

class ConceptField extends StatelessWidget {
  final String concept;
  
  const ConceptField({
    super.key, 
    required this.concept
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '¿En qué gastaste? $concept',
          style: const TextStyle(
            fontSize: 20,
            color: Colors.grey,
          ),
        ),
      ]
    );
  }
}