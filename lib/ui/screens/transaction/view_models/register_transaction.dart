import 'package:flutter/material.dart';
import 'package:finovate_mobile/ui/screens/transaction/models/account.dart';
import 'package:finovate_mobile/ui/screens/transaction/widgets/transaction_form.dart';

class RegisterTransactionScreen extends StatelessWidget {
  // datos simulados 
  static final List<Account> _mockAccounts = [
    Account(id: 'main', name: 'Cuenta Principal', currencySymbol: 'S/'),
    Account(id: 'savings', name: 'Ahorros', currencySymbol: 'S/'),
  ];

  const RegisterTransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nueva Transacción'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TransactionForm(
          accounts: _mockAccounts,
          onSave: () {
            // aqui va la logica para guardar la transacción
            // por ahora, solo volvemos a la pantalla anterior
            Navigator.of(context).pop();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Transacción guardada')),
            );
          },
        ),
      ),
    );
  }
}