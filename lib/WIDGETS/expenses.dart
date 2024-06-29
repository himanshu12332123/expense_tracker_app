
import 'package:expense_tracker/WIDGETS/new_expense.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/WIDGETS/expenses_list/expenses_list.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget{
Expenses({super.key});

  @override
  State<StatefulWidget> createState() {
  return _EXPENSESSTATE();
  }
}

class _EXPENSESSTATE extends State<Expenses>{
  final List<Expense> _registeredexpeneses = [
    Expense(
      title: 'FlutterCourse',
      amount:19.99,
      date: DateTime.now(),
      category: Category.work,
       ),
        Expense(
      title: 'Cinema',
      amount:29.99,
      date: DateTime.now(),
      category: Category.leisure,
       ),
  ];


  void _openaddexpenseoverlay(){
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
       builder: (ctx) => Newexpense( onaddexpense: _addExpense ),
        
       );

  }

  void _addExpense(Expense expense){
    setState(() {
        _registeredexpeneses.add(expense);

    });
  }

  void _removeexpenses(Expense expense){
    final expenseindex = _registeredexpeneses.indexOf(expense);
     setState(() {
       _registeredexpeneses.remove(expense);
     });
     ScaffoldMessenger.of(context).clearSnackBars();
     ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 3),
        content: Text('Expense deleted'),
        action : SnackBarAction(
          label: 'undo',
           onPressed: (){
            setState(() {
               _registeredexpeneses.insert(expenseindex,expense);
            });
           
           }
           )
        ),
      );
  }


  @override
  Widget build(BuildContext context){
    Widget maincontent = Center(
       child: Text('No expenses found. Start adding some!'),
       );

       if(_registeredexpeneses.isNotEmpty){
        maincontent = Expenseslist(
          expenses: _registeredexpeneses,
          onremoveexpense: _removeexpenses,
          );
       }

    return Scaffold(
        appBar:AppBar(
          title: Text("Flutter Expense Tracker"),
         actions: [
          IconButton(
            onPressed:_openaddexpenseoverlay,
           icon: Icon(Icons.add)
          ),
         ],
        ),
      body: Column(
      children: [
        Text('chart'),
       Expanded(
          child:  maincontent,
       )
      ],
    ),);
  }
}