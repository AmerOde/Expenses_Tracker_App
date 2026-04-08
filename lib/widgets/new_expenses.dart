import 'dart:ffi';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker_app/model/Expense.dart';

class NewExpenses extends StatefulWidget {
  const NewExpenses({super.key, required this.onAddExpense});

  final void Function(ExpenseModel expense) onAddExpense;

  @override
  State<NewExpenses> createState() {
    return _NewExtendsState();
  }
}

class _NewExtendsState extends State<NewExpenses> {
  // var _enterTitle = '';
  //
  // void _SaveInputText(String value) {
  //   _enterTitle = value;
  // }
  DateTime? _selectedDate;

  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  Category _selectedCategory = Category.leisure;

  void _PresentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final pickDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: now,
    );

    if (pickDate == null) return;

    setState(() {
      _selectedDate = pickDate;
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }
  void _showOkDialog(){
    if(Platform.isIOS){
      showCupertinoDialog(context: context, builder: (ctx) =>CupertinoAlertDialog(
          title: Text("Invalid Entry"),
          content: Text("Please Enter the valid title and the valid amount ! "),
          actions: [
          TextButton(
          onPressed: () {
      Navigator.pop(context);
      },
        child: Text("Ok"),)]));

    }else{
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text("Invalid Entry"),
          content: Text("Please Enter the valid title and the valid amount ! "),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Ok"),
            ),
          ],
        ),
      );
    }
  }

  void _SaveNewExpenses() {
    final _amount = double.tryParse(_amountController.text.toString());
    final isValidAmount = _amount == null;

    if (_titleController.text.isEmpty || isValidAmount ||_selectedDate == null) {
        _showOkDialog();
      return;
    }


    widget.onAddExpense(ExpenseModel(title: _titleController.text, amount: _amount, date: _selectedDate!, category: _selectedCategory));
    Navigator.pop(context);

  }

  @override
  Widget build(BuildContext context) {
    final keyboardSpace= MediaQuery.of(context).viewInsets.bottom;
    return SizedBox(
      height: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(16, 48, 16, 16 + keyboardSpace),

          child: Column(
            children: [
              TextField(
                controller: _titleController,
                maxLength: 50,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(label: Text("Title")),

                //onChanged: _SaveInputText,
              ),
              TextField(
                controller: _amountController,
                maxLength: 50,
                decoration: InputDecoration(
                  label: Text("amount"),
                  prefixText: "\$ ",
                ),
                keyboardType: TextInputType.number,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    _selectedDate == null
                        ? formatter.format(DateTime.now())
                        : formatter.format(_selectedDate!),
                  ),

                  IconButton(
                    onPressed: _PresentDatePicker,
                    icon: Icon(Icons.calendar_month),
                  ),
                ],
              ),

              Row(
                children: [
                  DropdownButton(
                    padding: EdgeInsets.all(5),
                    value: _selectedCategory,
                    items: Category.values.map((category) {
                      return DropdownMenuItem(
                        value: category,
                        child: Text(category.name.toUpperCase()),
                      );
                    }).toList(),
                    onChanged: (value) {
                      if (value == null) return;
                      setState(() {
                        _selectedCategory = value;
                      });
                    },
                  ),

                  const Spacer(),

                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: _SaveNewExpenses,
                        child: Text("Save"),
                      ),
                      const SizedBox(width: 8),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Cancel"),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
