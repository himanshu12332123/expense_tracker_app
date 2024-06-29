import 'dart:ffi';

import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class Newexpense extends StatefulWidget{
  Newexpense({super.key,
  required this.onaddexpense,
  });

  final void Function(Expense expense) onaddexpense;

  @override
  State<StatefulWidget> createState() {
   return _Newexpensestate();
  }
}

class _Newexpensestate extends State<Newexpense>{
 final _titlecontroller = TextEditingController();
  final _amountcontroller = TextEditingController();
  DateTime? selecteddate;
  Category _selectedcategory = Category.leisure;

void _presentdatepicker() async{
  final now = DateTime.now();
  final firstdate = DateTime(now.year - 1,now.month,now.day);
  final pickeddate = await  showDatePicker(context: context, 
 firstDate: firstdate,
  lastDate: now);

  setState(() {
    selecteddate = pickeddate;
  });

}

void _submitexpensedata(){
  final enteredamount = double.tryParse(_amountcontroller.text)  ;
  final amountisinvalid = enteredamount == null || enteredamount <= 0 ;
  if(_titlecontroller.text.trim().isEmpty || amountisinvalid || selecteddate == null){
    showDialog(context: context,
     builder: (ctx) => AlertDialog(
      title: Text('INVALID INPUT'),
      content: Text('PLEASE MAKE SURE TO ENTER VALID TITLE,AMOUNT,DATE AND CATEGORY'),
      actions: [
        TextButton(onPressed: ()
         {Navigator.pop(ctx);
         },
         child: Text('okay')
         ),
      ],
    ) 
    );
    return;
  }
  widget.onaddexpense(
    Expense(
      title: _titlecontroller.text ,
       amount: enteredamount,
        date: selecteddate!,
         category: _selectedcategory)
  );
  Navigator.pop(context);
}



 @override
  void dispose() {
    _titlecontroller.dispose();
     _amountcontroller.dispose();
    super.dispose();
  }
  

 @override
 Widget build(BuildContext context) {
     return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
        
           
         TextField(
           controller: _titlecontroller,
            maxLength: 50,
            decoration: InputDecoration(
              label: Text('Title'),
            ),
          ),
         
          Row(
            children: [
                Expanded(
               child:  TextField(
           controller: _amountcontroller,
           keyboardType: TextInputType.number,
            decoration: InputDecoration(
              prefixText: '\$',
              label: Text('Amount'),
            ),
          ),
           ),
           Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
            children: [
                Text( selecteddate == null ? 'No Selected Date' : formatter.format(selecteddate!)),
                IconButton(
                  onPressed: _presentdatepicker,
                   icon: Icon(Icons.calendar_month))
            ],
           ))

            ],
          ),
          const SizedBox(height:16),
          Row(
            children: [
              DropdownButton(
                value: _selectedcategory,
                items: Category.values.map(
                (category) => DropdownMenuItem(
                  value: category,
                  child: Text(category.name.toUpperCase(),
              ),
              ),
              ).toList(),
               onChanged: (value) {
                if(value == null){
                  return;
                }
             setState(() {
               _selectedcategory = value;
             });
               }),
              TextButton(
                onPressed: (){
                  Navigator.pop(context);
                },
               child: Text('cancel'),
               ),
              ElevatedButton(
                onPressed: _submitexpensedata,
                 child: Text('Save Expense'))
            ],
          )

        ],
      ),
      );
  }

}