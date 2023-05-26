class Expense {
  static const String table = 'expenses';
  static const String colId = 'id';
  static const String colName = 'name';
  static const String colAmount = 'amount';
  static const String colType = 'type';

  final int id;
  final String name;
  final double amount;
  final String type;

  Expense(
      {required this.id,
      required this.name,
      required this.amount,
      required this.type});

  Map<String, dynamic> toMap() {
    return {colId: id, colName: name, colAmount: amount, colType: type};
  }
}
