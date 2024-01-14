import 'package:expense_tracker/config/extensions.dart';
import 'package:expense_tracker/enums/enums.dart';
import 'package:expense_tracker/provider/loan/loan_provider.dart';
import 'package:expense_tracker/styles/color.dart';
import 'package:expense_tracker/styles/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_text_form_field/flutter_text_form_field.dart';
import 'package:provider/provider.dart';

class AddLoanScreen extends StatefulWidget {
  const AddLoanScreen({super.key});

  @override
  State<AddLoanScreen> createState() => _AddLoanScreenState();
}

class _AddLoanScreenState extends State<AddLoanScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<LoanProviderImpl>(builder: (context, state, _) {
      return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Loan Name",
                style: AppTheme.headerStyle(),
              ),
              8.height(),
              CustomTextField(
                state.loanNameController,
                hint: 'Loan Name',
                password: false,
                border: Border.all(color: greyColor),
              ),
              20.height(),
              Text(
                "Loan Type",
                style: AppTheme.headerStyle(),
              ),
              ...List.generate(LoanType.values.length, (index) {
                final type = LoanType.values[index];

                final loanText = type == LoanType.LoanGivenByMe ? 'Giving out a loan?' : 'Taking a loan?';

                return RadioListTile(
                  value: index,
                  groupValue: state.selectedLoanType,
                  onChanged: (value) {
                    state.selectedLoanType = value!;
                  },
                  title: Text(loanText),
                );
              })
            ],
          ),
        ),
      );
    });
  }
}
