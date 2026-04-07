import 'package:expense_tracker_app/widgets/expenses_list/expenses_item.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker_app/model/Expense.dart';
class  Expenseslist extends StatelessWidget{
  const Expenseslist({required this.data,required this.onRemove,super.key});
  final List<ExpenseModel> data;

  final void  Function (ExpenseModel expense) onRemove;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemCount: data.length,
      
      itemBuilder: (ctx,index) => Dismissible(key: ValueKey(data[index]),
          onDismissed: (direction) => onRemove(data[index]),
          child:ExpensesItem(expenses: data[index]) ),);
  }


}