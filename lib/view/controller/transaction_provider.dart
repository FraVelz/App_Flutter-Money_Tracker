import 'package:flutter/material.dart';
import 'package:money_tracker/view/model/transaction.dart';

class TransactionProvider with ChangeNotifier {
  final List<Transaction> _transactions = [
    
    Transaction(
      type: TransactionType.income, 
      amount: 1000.00, description: 'Salary'
    ),
    
    Transaction(
      type: TransactionType.expense, 
      amount: -500.00, description: 'Rent'
    )
  ];

  List<Transaction> get transactions => _transactions;

  double getTotalImcomes() {
    return _transactions
      .where( (transactions) => transactions.type == TransactionType.income )
      .map( (transactions) => transactions.amount)
      .fold(0, (a, b) => a + b);
  }
  
  double getTotalExpenses() {
    return _transactions
      .where( (transactions) => transactions.type == TransactionType.expense )
      .map( (transactions) => transactions.amount)
      .fold(0, (a, b) => a + b);
  }

  double getBalance() => getTotalImcomes() - getTotalExpenses().abs();

  void addTransaction(Transaction transaction) {
    _transactions.add(transaction);
    notifyListeners();
  }
}