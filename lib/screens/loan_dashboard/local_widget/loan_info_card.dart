import 'package:expense_tracker/config/extensions.dart';
import 'package:expense_tracker/styles/color.dart';
import 'package:expense_tracker/styles/theme.dart';
import 'package:flutter/material.dart';

class LoanInfoCard extends StatelessWidget {
  final bool isLoaned;
  final Function() onTap;
  const LoanInfoCard({super.key, this.isLoaned = false, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 200,
        width: 150,
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: primaryColor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.outbond,
                  color: isLoaned ? redColor : greenColor,
                ),
                Expanded(
                  child: Text(
                    '\$50,000666',
                    textAlign: TextAlign.right,
                    style: AppTheme.subTitleStyle(),
                  ),
                ),
              ],
            ),
            const Spacer(),
            Text(
              'Emergency Loan'.ellipsis(),
              style: AppTheme.titleStyle(isBold: true),
            ),
            Text(isLoaned
                ? 'Loaned to'
                : 'Owed by'), //return loaned to or owed by depending on the type of loan
            Text('Destiny Ed'.ellipsis(), style: AppTheme.titleStyle(isBold: true)),
            const Text('On'),
            Text('1st July 2024', style: AppTheme.titleStyle(isBold: true)),
          ],
        ),
      ),
    );
  }
}
