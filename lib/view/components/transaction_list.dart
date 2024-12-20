
import 'package:flutter/material.dart';
import 'package:money_tracker/view/controller/transaction_provider.dart';
import 'package:money_tracker/view/model/transaction.dart';
import 'package:provider/provider.dart';

class TransactionList extends StatelessWidget {
  const TransactionList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final transactions = Provider.of<TransactionProvider>(context).transactions;

    return Expanded (
      child: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(207, 182, 236, 237),
        ),
        
        child: ListView.builder(
          itemCount: transactions.length, 

          itemBuilder: (context, index) {
            final transaction = transactions[index];

            final type = transaction.type == TransactionType.income 
              ? 'Income' : 'Expense';

            final value = transaction.type == TransactionType.expense 
            ? '\$ -${transaction.amount.abs().toStringAsFixed(2)}' 
            : '\$ ${transaction.amount.toStringAsFixed(2)}';

            final color = transaction.type == TransactionType.expense 
              ? const Color.fromARGB(255, 160, 11, 0)
              : const Color.fromARGB(255, 46, 96, 48);

            return ListTile(
              title: Text(transaction.description),
              subtitle: Text(type),

              trailing: Text(
                value, style: TextStyle(
                  color: color, fontWeight: FontWeight.bold, 
                  fontSize: 18
                )
              ),
            );
          }
        )
      ),
      
    );
  }
}
