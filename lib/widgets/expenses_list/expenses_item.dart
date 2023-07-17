import 'package:flutter/material.dart';
import 'package:tracker_app/models/expense.dart';
import 'package:intl/intl.dart';

class ExpenseItem extends StatelessWidget {
   ExpenseItem(this.expense, {super.key});

  final Expense expense;

  final amountFormatter = NumberFormat("#,###");


  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        child: Column(
          children: [
            Text(expense.title),
            const SizedBox(
              height: 4,
            ),
            Row(
              children: [
                Text('¥${amountFormatter.format(expense.amount)}'),
                const Spacer(),
                Row(
                  children: [
                     Icon(categoryIcons[expense.category]),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(expense.formattedDate),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
