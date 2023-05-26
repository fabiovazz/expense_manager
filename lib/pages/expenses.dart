import 'package:expense_manager/models/expense_dao.dart';
import 'package:flutter/material.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';

import '../models/expense.dart';

class ExpensesPage extends StatefulWidget {
  const ExpensesPage({super.key});
  @override
  State<ExpensesPage> createState() => _ExpensesPage();
}

class _ExpensesPage extends State<ExpensesPage> {
  List<Expense> expenses = [];
  final ExpenseDAO _dao = ExpenseDAO();
  bool _isSearching = false;
  TextEditingController nameExpense = TextEditingController();
  TextEditingController typeExpense = TextEditingController();
  TextEditingController amountExpense = TextEditingController();
  getExpenses() {
    _dao.getAll().then((value) => setState(() {
          expenses = value;
          nameExpense.text = "";
          typeExpense.text = "";
          amountExpense.text = "";
        }));
  }

  _ExpensesPage() {
    _dao
        .connect()
        .then((value) => _dao.getAll().then((value) => getExpenses()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 0, 0, 1),
      body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        const Padding(padding: EdgeInsets.only(top: 30)),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(padding: EdgeInsets.only(top: 20)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Align(
                  alignment: const AlignmentDirectional(0, 0),
                  child: SizedBox(
                    width: 150,
                    height: 80,
                    child: TextFormField(
                      keyboardType: TextInputType.name,
                      autofocus: true,
                      decoration: InputDecoration(
                        labelText: 'Categoria',
                        labelStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                        filled: true,
                        focusedBorder: UnderlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.amber,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.white,
                            width: 0.5,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0, 0),
                  child: SizedBox(
                    width: 150,
                    height: 80,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      autofocus: true,
                      inputFormatters: [
                        CurrencyTextInputFormatter(
                          locale: 'pt_BR',
                          decimalDigits: 2,
                          symbol: 'R\$',
                        )
                      ],
                      decoration: InputDecoration(
                        labelText: 'Preço',
                        labelStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                        filled: true,
                        focusedBorder: UnderlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.amber,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.white,
                            width: 0.5,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.only(top: 20)),
            Align(
              alignment: const AlignmentDirectional(0, 0),
              child: SizedBox(
                width: 350,
                height: 80,
                child: TextFormField(
                  keyboardType: TextInputType.name,
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: 'Nome da Despesa',
                    labelStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                    filled: true,
                    focusedBorder: UnderlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.amber,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.white,
                        width: 0.5,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 30)),
            FilledButton(
                onPressed: () {},
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.amber),
                ),
                child: const Text(
                    style: TextStyle(
                      color: Color.fromRGBO(43, 45, 71, 1),
                      fontSize: 16,
                    ),
                    "Adicionar Despesa")),
            const Padding(padding: EdgeInsets.only(top: 30)),
            Row(
              children: [
                const Padding(padding: EdgeInsets.all(10)),
                !_isSearching
                    ? Row(
                        children: [
                          const Text(
                              style: TextStyle(
                                color: Color.fromRGBO(228, 224, 224, 1),
                                fontSize: 16,
                              ),
                              "Despesas Cadastradas"),
                          const Padding(padding: EdgeInsets.all(10)),
                          Container(
                            alignment: Alignment.bottomCenter,
                            child: CircleAvatar(
                              backgroundColor: Colors.amber,
                              radius: 15,
                              child: IconButton(
                                onPressed: () =>
                                    {setState(() => _isSearching = true)},
                                splashRadius: 20,
                                padding: EdgeInsets.zero,
                                icon: const Icon(
                                  Icons.search,
                                  color: Colors.black,
                                  size: 20,
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    : Row(
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(0, 0),
                            child: SizedBox(
                              width: 200,
                              height: 80,
                              child: TextFormField(
                                keyboardType: TextInputType.name,
                                autofocus: true,
                                decoration: InputDecoration(
                                  labelText: 'Pesquisar por categoria',
                                  labelStyle: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                  filled: true,
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Colors.amber,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Colors.white,
                                      width: 0.5,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                style: const TextStyle(
                                  fontFamily: 'Poppins',
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.bottomCenter,
                            child: CircleAvatar(
                              backgroundColor: Colors.amber,
                              radius: 15,
                              child: IconButton(
                                onPressed: () => {},
                                splashRadius: 20,
                                padding: EdgeInsets.zero,
                                icon: const Icon(
                                  Icons.search,
                                  color: Colors.black,
                                  size: 20,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                const Align()
              ],
            ),
            const Padding(padding: EdgeInsets.only(top: 20)),
          ],
        )
      ]),
    );
  }

  double sumTotalAmount() {
    double totalAmount = 0;
    for (Expense expense in expenses) {
      totalAmount += expense.amount;
    }
    return totalAmount;
  }
}