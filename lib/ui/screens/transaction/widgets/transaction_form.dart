import 'package:finovate_mobile/ui/screens/transaction/widgets/category_grid.dart';
import 'package:flutter/material.dart';
import 'package:finovate_mobile/ui/core/models/account.dart';
import 'package:finovate_mobile/ui/core/models/transaction.dart';
import 'package:finovate_mobile/ui/screens/transaction/widgets/account_selector.dart';
import 'package:finovate_mobile/ui/screens/transaction/widgets/amount_display.dart';
import 'package:finovate_mobile/ui/screens/transaction/widgets/concept_field.dart';
import 'package:finovate_mobile/ui/screens/transaction/widgets/date_picker_widget.dart';
import 'package:finovate_mobile/ui/screens/transaction/widgets/save_transaction_button.dart';
import 'package:finovate_mobile/ui/screens/transaction/widgets/transaction_type_toggle.dart';

//Layout de TransactionForm
class TransactionForm extends StatefulWidget {
  final List<Account> accounts;
  final VoidCallback onSave;

  const TransactionForm({
    super.key,
    required this.accounts,
    required this.onSave,
  });

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  double _amount = 0.0;
  TransactionType _type = TransactionType.expense;
  String _concept = '';
  DateTime _date = DateTime.now();
  String? _selectedAccountId;
  String? _selectedCategory;

  @override
  void initState() {
    super.initState();
    // Selecciona la primera cuenta por defecto
    if (widget.accounts.isNotEmpty) {
      _selectedAccountId = widget.accounts.first.id;
    }
  }

  bool get _isFormValid {
    return _amount > 0 &&
        _concept.trim().isNotEmpty &&
        _selectedAccountId != null &&
        _selectedCategory != null;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Monto grande
        AmountDisplay(
          amount: _amount,
          currencySymbol: 'S/',
          onAmountChanged: (amount) => setState(() => _amount = amount),
        ),
        const SizedBox(height: 20),

        // Tipo: Ingreso / Gasto
        TransactionTypeToggle(
          initialType: _type,
          onTypeChanged: (type) => setState(() => _type = type),
        ),
        const SizedBox(height: 20),

        // Concepto
        ConceptField(
          initialConcept: _concept,
          onConceptChanged: (value) => setState(() => _concept = value),
        ),
        const SizedBox(height: 20),

        // Categoría de transacción
        CategoryGrid(
          categories: [
            Category(
              name: 'Comida',
              icon: Icons.fastfood,
              isSelected: _selectedCategory == 'Comida',
            ),
            Category(
              name: 'Transporte',
              icon: Icons.directions_car,
              isSelected: _selectedCategory == 'Transporte',
            ),
            Category(
              name: 'Salud',
              icon: Icons.health_and_safety,
              isSelected: _selectedCategory == 'Salud',
            ),
            Category(
              name: 'Entretenimiento',
              icon: Icons.movie,
              isSelected: _selectedCategory == 'Entretenimiento',
            ),
          ],
          onSelected: (category) {
            setState(() => _selectedCategory = category.name);
          },
        ),
        const SizedBox(height: 20),

        // Fecha y Cuenta (en fila)
        Row(
          children: [
            Expanded(
              child: DatePickerWidget(
                initialDate: _date,
                onDateSelected: (date) => setState(() => _date = date),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: AccountSelector(
                accounts: widget.accounts,
                selectedAccountId: _selectedAccountId,
                onAccountSelected: (account) =>
                    setState(() => _selectedAccountId = account.id),
              ),
            ),
          ],
        ),
        const SizedBox(height: 32),

        // Botón de guardar
        SaveTransactionButton(
          isEnabled: _isFormValid,
          onPressed: () {
            // Aquí podrías crear el objeto Transaction y guardarlo
            // ignore: unused_local_variable
            final newTransaction = Transaction(
              id: DateTime.now().millisecondsSinceEpoch.toString(),
              amount: _amount,
              type: _type,
              concept: _concept,
              date: _date,
              accountId: _selectedAccountId!,
            );
            // Notificar al padre
            widget.onSave();
          },
        ),
      ],
    );
  }
}
