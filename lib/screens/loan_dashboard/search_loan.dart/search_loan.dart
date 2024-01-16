import 'package:expense_tracker/config/extensions.dart';
import 'package:expense_tracker/screens/loan_dashboard/local_widget/loan_info_card.dart';
import 'package:expense_tracker/styles/color.dart';
import 'package:expense_tracker/styles/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_text_form_field/flutter_text_form_field.dart';
import 'package:go_router/go_router.dart';

class SearchLoanScreen extends StatefulWidget {
  const SearchLoanScreen({super.key});

  @override
  State<SearchLoanScreen> createState() => _SearchLoanScreenState();
}

class _SearchLoanScreenState extends State<SearchLoanScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Search Loan',
          style: AppTheme.headerStyle(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CustomTextField(
              TextEditingController(),
              hint: 'Enter loan name',
              password: false,
              border: Border.all(color: greyColor),
              onFieldSubmitted: (value) {
                print(value);
              },
            ),
            20.height(),
            // Container(
            //   margin: const EdgeInsets.symmetric(vertical: 50),
            //   child: Text(
            //     'No Loan Found',
            //     style: AppTheme.headerStyle(color: primaryColor),
            //   ),
            // ),
            Expanded(
              child: GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
                children: List.generate(
                  10,
                  (index) {
                    return const Text("dfldf");
                    // return LoanInfoCard(
                    //   onTap: () {
                    //     context.push('/view_loan');
                    //   },
                    //   isLoaned: true,
                    // );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
