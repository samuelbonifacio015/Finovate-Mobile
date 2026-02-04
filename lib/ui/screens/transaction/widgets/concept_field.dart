import 'package:flutter/material.dart';

// TextField con iconos y placeholder
class ConceptField extends StatelessWidget {
  final String initialConcept;
  final ValueChanged<String> onConceptChanged;

  const ConceptField({
    super.key,
    this.initialConcept = '',
    required this.onConceptChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onConceptChanged,
      decoration: InputDecoration(
        labelText: 'Concepto',
        hintText: '¿En qué gastaste?',
        prefixIcon: const Icon(Icons.edit_note, color: Colors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      ),
      controller: TextEditingController.fromValue(
        TextEditingValue(
          text: initialConcept,
          selection: TextSelection.collapsed(offset: initialConcept.length),
        ),
      ),
    );
  }
}