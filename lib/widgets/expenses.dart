import 'package:flutter/material.dart';

import 'package:tracker_app/widgets/expenses_list/expenses_list.dart';
import 'package:tracker_app/models/expense.dart';
import 'package:tracker_app/widgets/new_expense.dart';
import 'package:tracker_app/widgets/chart/chart.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
        title: 'flutter',
        amount: 90000,
        date: DateTime.now(),
        category: Category.work),
    Expense(
        title: 'cinema',
        amount: 90000,
        date: DateTime.now(),
        category: Category.leisure),
  ];

  void _openAddExpensesModal() {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(onAddExpense: _addExpense),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 4),
        content: const Text('削除しました。'),
        action: SnackBarAction(
          label: '元に戻す',
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(expenseIndex, expense);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    Widget mainContent = const Center(
      child: Text('経費が見つかりません。追加してください。'),
    );
    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
          expenses: _registeredExpenses, onRemoveExpense: _removeExpense);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('家計簿アプリ'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: _openAddExpensesModal, icon: Icon(Icons.add))
        ],
      ),
      body: width < 600
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Chart(expenses: _registeredExpenses),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      '経費',
                      style: TextStyle(),
                    ),
                  ),
                  Expanded(
                    child: mainContent,
                  )
                ],
              ),
            )
          : Row(
              children: [
                Expanded(child: Chart(expenses: _registeredExpenses)),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    '経費',
                    style: TextStyle(),
                  ),
                ),
                Expanded(
                  child: mainContent,
                )
              ],
            ),
    );
  }
}
