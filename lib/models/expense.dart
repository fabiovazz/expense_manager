class Expense {
  static const String table = 'expenses';
  static const String colId = 'id';
  static const String colName = 'name';
  static const String colAmount = 'amount';
  static const String colType = 'type';

  int? id;
  final String name;
  final num amount;
  final String type;

  Expense({
    this.id,
    required this.name,
    required this.amount,
    required this.type,
  });

  Map<String, dynamic> toMap() {
    return {colId: id, colName: name, colAmount: amount, colType: type};
  }
}
