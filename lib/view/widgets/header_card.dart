import 'package:flutter/material.dart';

class HeaderCard extends StatelessWidget {
  final String title;
  final double amount;
  final Widget icon;

  const HeaderCard({
    super.key,
    required this.title, 
    required this.amount, 
    required this.icon
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Expanded(
      child: Card(
        margin: EdgeInsets.zero,
        color: const Color.fromARGB(220, 191, 244, 250),
        
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  icon,
                  const SizedBox(height: 3),

                  Text(title, style: const TextStyle(color: Colors.black)),
                ],
              ),
              
              Text('\$ ${amount.toStringAsFixed(2)}', style: textTheme.titleLarge)
            ],
          ),
        )
      ),
    );
  }
}