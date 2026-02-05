/// Representa una cuenta financiera (ej. Cuenta Corriente, Ahorros)
class Account {
  final String id;
  final String name;
  final String currencySymbol;

  Account({
    required this.id,
    required this.name,
    this.currencySymbol = 'S/',
  });

  // Map a JSON
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'currencySymbol': currencySymbol,
      };

  // JSON a Map
  factory Account.fromJson(Map<String, dynamic> json) {
    return Account(
      id: json['id'] as String,
      name: json['name'] as String,
      currencySymbol: json['currencySymbol'] as String? ?? '\$',
    );
  }
}