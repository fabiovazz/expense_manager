class Expense {
  static const String table = 'expenses';
  static const String colName = 'name';
  static const String colAmount = 'amount';
  static const String colType = 'type';

  final String name;
  final num amount;
  final String type;

  Expense({
    required this.name,
    required this.amount,
    required this.type,
  });

  Map<String, dynamic> toMap() {
    return {colName: name, colAmount: amount, colType: type};
  }
}
