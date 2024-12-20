import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:money_tracker/view/controller/transaction_provider.dart';
import 'package:money_tracker/view/model/transaction.dart';
import 'package:provider/provider.dart';

class AddTransactionDialog extends StatefulWidget {
  const AddTransactionDialog({super.key});

  @override
  State<AddTransactionDialog> createState() =>
    _AddTransactionDialogState();
}

class _AddTransactionDialogState extends 
State<AddTransactionDialog> {
  
  int typeIndex = 0;
  late TransactionType type = TransactionType.income;

  double amount = 0;
  String description = '';

  @override
  Widget build(BuildContext context) {
  final textTheme = Theme.of(context).textTheme;

    return Material(
      color: Colors.black,
      borderRadius: const BorderRadius.vertical(
        top: Radius.circular(40.0)
      ),

      child: SizedBox(
        height: 680,
        width: double.infinity,
      
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          
          child: Column(
            mainAxisSize: MainAxisSize.min,
      
            children: [
              Container(
                height: 6, width: 108,
                margin: const EdgeInsets.only(top: 5),
          
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 0, 212, 194), 
                  borderRadius: BorderRadius.circular(3)
                ),
              ),
      
              const Padding(
                padding: EdgeInsets.all(20),            
                
                child: Text(
                  'New Transaction',
                  style: TextStyle(
                    fontSize: 30, 
                    color: Color.fromARGB(255, 0, 212, 194), 
                    fontWeight: FontWeight.bold
                  ),
                
                ),
              ),
              
              CupertinoSlidingSegmentedControl(
                groupValue: typeIndex,

                children: const {
                  0: Text('Income'),
                  1: Text('Expense')
                },
                 onValueChanged: (value){
                  setState(() {
                    typeIndex = value!;
                    
                    type = value == 0 
                      ? TransactionType.income 
                      : TransactionType.expense;
                  });
                },
                backgroundColor: const Color.fromARGB(199, 0, 212, 194),
                thumbColor:  const Color.fromARGB(255, 0, 212, 194),
              ),

              const SizedBox(height: 30),

              Text(
                'Amount', 
                style: textTheme.bodySmall!.copyWith(
                  color: const Color.fromARGB(255, 0, 212, 194), 
                  fontSize: 30
                )
              ),

              TextField(
                cursorColor: const Color.fromARGB(168, 0, 212, 194), 
                textAlign: TextAlign.center,
                autofocus: true,
                style: const TextStyle(
                  color: Color.fromARGB(168, 0, 212, 194)
                ),

                onChanged: (value) {
                  final vl = value.replaceAll('\$', '')
                    .replaceAll(',', '');
                  
                  if (vl.isNotEmpty) {
                    amount = double.parse(vl);
                  }
                },

                keyboardType: TextInputType.number,
                inputFormatters: [
                  CurrencyTextInputFormatter.currency(symbol: '\$')],
              
                decoration: const InputDecoration.collapsed(
                  hintText: '\$ 0.00', 
                  hintStyle: TextStyle(
                    color: Color.fromARGB(168, 0, 212, 194))
                )
              ),

              const SizedBox(height: 30),

              Text(
                'Description', 
                style: textTheme.bodySmall!.copyWith(
                  color: const Color.fromARGB(255, 0, 212, 194), 
                  fontSize: 30
                )
              ),

              TextField(
                textAlign: TextAlign.center,

                style: const TextStyle(
                  color: Color.fromARGB(168, 0, 212, 194)),
                 
                keyboardType: TextInputType.text,

                onChanged: (value) { description = value; },

                decoration: const InputDecoration.collapsed(
                  hintText: 'Enter a description',
                  
                  hintStyle: TextStyle(
                    color: Color.fromARGB(168, 0, 212, 194),)
                )
              ),

              const SizedBox(height: 20),

              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                    final transaction = Transaction(
                      type: type, amount: amount, description: description
                    ); 

                    Provider.of<TransactionProvider>(
                      context, listen: false
                    ).addTransaction(transaction);
                  }, 
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color
                      .fromARGB(105, 0, 212, 194)
                  ),

                  child: const Text(
                    'Add Transaction', 
                
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 255, 234), 
                    )
                  )
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}