import 'package:expense_tracker_app/widgets/chart/chart.dart';
import 'package:expense_tracker_app/widgets/expenses_list/expenseslist.dart';
import 'package:expense_tracker_app/widgets/new_expenses.dart';
import 'package:flutter/material.dart';

import 'model/Expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<ExpenseModel> _registeredExpenses = [
    ExpenseModel(
      title: "hi",
      amount: 3,
      category: Category.food,
      date: DateTime.now(),
    ),
    ExpenseModel(
      title: "Hello",
      amount: 7.5,
      category: Category.travel,
      date: DateTime.now(),
    ),
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) {
        return NewExpenses(onAddExpense: addExpenses);
      },
    );
  }

  void addExpenses(ExpenseModel expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpenses(ExpenseModel expense) {
    var expenseIndex = _registeredExpenses.indexOf(expense);

    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text("Expense Deleted!"),
        action: SnackBarAction(
          label: "Undo",
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
    Widget contentMain = Center(child: Text("No Expenses Yet ! "));
    final width = MediaQuery.of(context).size.width;
    if (_registeredExpenses.isNotEmpty) {
      contentMain = Expenseslist(
        data: _registeredExpenses,
        onRemove: _removeExpenses,
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Expenses App"),
        actions: [
          IconButton(onPressed: _openAddExpenseOverlay, icon: Icon(Icons.add)),
        ],
      ),
      body: width <= 600
          ? Column(
              children: [
                Chart(expenses: _registeredExpenses),
                Expanded(child: contentMain),
              ],
            )
          : Row(
              children: [
                Expanded(child: Chart(expenses: _registeredExpenses)),
                Expanded(child: contentMain),
              ],
            ),
    );
  }
}
