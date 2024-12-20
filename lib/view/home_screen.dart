import 'package:flutter/material.dart';
import 'package:money_tracker/view/components/add_transaction_dialog.dart';
import 'package:money_tracker/view/components/home_header.dart';
import 'package:money_tracker/view/components/transaction_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,

      body: const SafeArea(
        bottom: false,

        child: Column(
          children: [
            HomeHeader(),
            TransactionList(),
          ],
        ),
      ),
      
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        foregroundColor: const Color.fromARGB(255, 191, 244, 250),

        onPressed: () {
          showModalBottomSheet(
            context: context, 
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
            ),

            // builder: (context)  => const AddTransactionDialog(),
            builder: (context) {
              return const AddTransactionDialog();
            },

          );
        },

        child: const Icon(Icons.add)
      )
    );
  }
}
