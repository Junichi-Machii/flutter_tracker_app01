
import 'package:flutter/material.dart';
import 'package:tracker_app/models/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
final List<Expense> _registeredExpenses = [
  Expense(title: 'flutter', amount: 19.99, date: DateTime.now(), category: Category.work),
  Expense(title: 'cinema', amount: 29.99, date: DateTime.now(), category: Category.leisure),
];

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('data,'),
            Text('data'),
          ],
        ),
      ),
    );
  }
}