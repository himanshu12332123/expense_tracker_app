import 'package:expense_tracker/WIDGETS/expenses_list/expense_item.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class Expenseslist extends StatelessWidget{
     Expenseslist({
      super.key,
      required this.expenses,
      required this.onremoveexpense,
    });

    final List<Expense> expenses;
    final void Function(Expense expense) onremoveexpense;
  
  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemCount: expenses.length,
      itemBuilder: (ctx,index) => Dismissible(
        key: ValueKey(expenses[index]),
        onDismissed: (direction){
          onremoveexpense(expenses[index]);
        } ,
       child: Expenseitem(expenses[index])) ,
   
     );
    
  }

} 