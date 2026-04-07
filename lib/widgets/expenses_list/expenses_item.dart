import 'package:expense_tracker_app/expenses.dart';
import 'package:expense_tracker_app/widgets/expenses_list/expenseslist.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker_app/model/Expense.dart';

class ExpensesItem extends StatelessWidget{
  const ExpensesItem({required this.expenses ,super.key});

  final   ExpenseModel expenses;


  @override
  Widget build(BuildContext context) {
      return Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 16),
          child: Column(children: [

            Text(expenses.title),
            SizedBox(height: 5,),
            Row(children: [
              Text(expenses.amount.toStringAsFixed(2)),
              Spacer(),
              Row(children: [

                Icon(iconsCategory[expenses.category]),
                SizedBox(width: 8,),
                Text(expenses.formattedDate)


              ],)
            ],)
          ],)
        ),);
  }
}