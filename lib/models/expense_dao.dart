import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as pat;

import 'expense.dart';

class ExpenseDAO {
  static const String databaseName = 'expenses.db';
  late Future<Database> database;

  Future connect() async {
    var databasesPath = await getDatabasesPath();
    String path = pat.join(databasesPath, databaseName);
    database = openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        db.execute("CREATE TABLE IF NOT EXISTS ${Expense.table} ("
            "${Expense.colName} TEXT,"
            "${Expense.colAmount} REAL,"
            "${Expense.colType} TEXT )");
      },
    );
  }

  Future<List<Expense>> getAll() async {
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query(Expense.table);

    return List.generate(maps.length, (i) {
      return Expense(
          name: maps[i][Expense.colName],
          amount: maps[i][Expense.colAmount],
          type: maps[i][Expense.colType]);
    });
  }

  Future<int> insert(Expense expense) async {
    final Database db = await database;
    return await db.insert(Expense.table, expense.toMap());
  }

  Future delete() async {
    final Database db = await database;
    db.delete(Expense.table);
  }
}
