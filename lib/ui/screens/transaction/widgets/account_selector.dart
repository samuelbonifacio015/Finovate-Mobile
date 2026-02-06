import 'package:flutter/material.dart';
import 'package:finovate_mobile/ui/core/models/account.dart';

/// Selector de cuenta (Dropdown) para transacciones
class AccountSelector extends StatelessWidget {
  final List<Account> accounts;
  final String? selectedAccountId;
  final ValueChanged<Account> onAccountSelected;

  const AccountSelector({
    super.key,
    required this.accounts,
    this.selectedAccountId,
    required this.onAccountSelected,
  });

  @override
  Widget build(BuildContext context) {
    // Encuentra la cuenta seleccionada (si existe)
    final selectedAccount = accounts.firstWhere(
      (account) => account.id == selectedAccountId,
      orElse: () => accounts.isNotEmpty
          ? accounts.first
          : Account(id: '', name: 'Sin cuentas'),
    );

    return DropdownButtonFormField<Account>(
      initialValue: selectedAccount.id.isEmpty ? null : selectedAccount,
      items: accounts.map((account) {
        return DropdownMenuItem<Account>(
          value: account,
          child: Row(
            children: [
              const Icon(Icons.account_balance, size: 18, color: Colors.grey),
              const SizedBox(width: 8),
              Text(account.name),
            ],
          ),
        );
      }).toList(),
      onChanged: (Account? account) {
        if (account != null) {
          onAccountSelected(account);
        }
      },
      decoration: InputDecoration(
        labelText: 'Cuenta',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 12,
        ),
      ),
      dropdownColor: Colors.white,
      icon: const Icon(Icons.arrow_drop_down),
    );
  }
}
