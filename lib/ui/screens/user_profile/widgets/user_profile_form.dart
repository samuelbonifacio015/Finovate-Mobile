import 'package:finovate_mobile/ui/core/models/transaction.dart';
import 'package:finovate_mobile/ui/screens/user_profile/widgets/recent_operations.dart';
import 'package:finovate_mobile/ui/screens/user_profile/widgets/total_balance_card.dart';
import 'package:flutter/material.dart';

//Layout de UserProfile

class UserProfileForm extends StatefulWidget {
  final List<Transaction> recentTransactions;
  
  const UserProfileForm({
    super.key,
    this.recentTransactions = const [],
  });

  @override
  State<UserProfileForm> createState() => _UserProfileFormState();
}

class _UserProfileFormState extends State<UserProfileForm> {
  String _userName = 'Usuario';
  DateTime _date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TotalBalance(
          totalBalance: widget.recentTransactions.fold(0.0, (sum, tx) => sum + tx.amount),
          currencySymbol: 'S/',
        ),
        const SizedBox(height: 16),

        RecentOperations(
          netAmount: widget.recentTransactions.fold(0.0, (sum, tx) => sum + tx.amount),
          currencySymbol: 'S/',
        ),  
      ]
    );
  }
}