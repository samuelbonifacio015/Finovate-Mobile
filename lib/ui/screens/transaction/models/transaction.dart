import 'package:finovate_mobile/ui/screens/transaction/models/account.dart';

/// Tipo de transacción: ingreso o gasto
enum TransactionType { income, expense }

/// Representa una transacción financiera
class Transaction {
  final String id;
  final double amount;
  final TransactionType type;
  final String concept;
  final DateTime date;
  final String accountId;

  Transaction({
    required this.id,
    required this.amount,
    required this.type,
    required this.concept,
    required this.date,
    required this.accountId,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'amount': amount,
        'type': type.name,
        'concept': concept,
        'date': date.toIso8601String(),
        'accountId': accountId,
      };

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      id: json['id'] as String,
      amount: (json['amount'] as num).toDouble(),
      type: TransactionType.values.firstWhere(
        (t) => t.name == json['type'],
        orElse: () => TransactionType.expense,
      ),
      concept: json['concept'] as String,
      date: DateTime.parse(json['date']),
      accountId: json['accountId'] as String,
    );
  }
}