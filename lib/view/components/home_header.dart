
import 'package:flutter/material.dart';
import 'package:money_tracker/view/controller/transaction_provider.dart';
import 'package:money_tracker/view/widgets/header_card.dart';
import 'package:provider/provider.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;

    final provider = Provider.of<TransactionProvider>(context);
    
    final balance = provider.getBalance();
    final income = provider.getTotalImcomes();
    final expense = provider.getTotalExpenses();
    
    return SizedBox(
      width: double.infinity,
      
      child: Padding(
        padding: const EdgeInsets.all(8.0),

        child: Column(
          children: [
            const SizedBox(height: 20),

            Text( 'Money Tracker',
              style: textStyle.titleSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(206, 191, 244, 250),
              ),
            ),
            
            const SizedBox( height: 17),
        
            Text('Balance',
              style: textStyle.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 191, 244, 250),
              ),
            ),
        
            
            Text( '\$ ${balance.toStringAsFixed(2)}',
              style: textStyle.headlineLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 191, 244, 250),
              ),
            ),

            const SizedBox(height: 20),
        
            Row(
              children: [
                HeaderCard(
                  title: 'Incomes',
                  amount: income,
                  icon: const Icon(Icons.money_off, color: Colors.teal)
                ),

                const SizedBox(width: 12),
                
                HeaderCard(
                  title: 'Expenses',
                  amount: expense,
                  icon: const Icon(Icons.money_off, color: Colors.red)
                ),
              ]
            )
        
          ],
        ),
      ),
    );
  }
}
