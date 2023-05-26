import 'package:flutter/material.dart';

import 'Expenses.dart';

void main() {
  runApp(const MaterialApp(home: Home()));
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Padding(padding: EdgeInsets.only(top: 25)),
          const Column(
            children: [
              Text(
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 40),
                  'Controle Suas'),
              Text(
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.amber,
                    fontSize: 40,
                  ),
                  'Despesas'),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 50),
            alignment: Alignment.bottomCenter,
            child: CircleAvatar(
              backgroundColor: Colors.amber,
              radius: 40,
              child: IconButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ExpensesPage())),
                splashRadius: 45,
                padding: EdgeInsets.zero,
                icon: const Icon(
                  Icons.arrow_forward_outlined,
                  color: Colors.black,
                  size: 40,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
