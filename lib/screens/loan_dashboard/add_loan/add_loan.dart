import 'package:currency_picker/currency_picker.dart';
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
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
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
                      activeColor: primaryColor,
                      contentPadding: const EdgeInsets.all(0),
                      value: index,
                      groupValue: state.selectedLoanType,
                      onChanged: (value) {
                        state.selectedLoanType = value;
                      },
                      title: Text(loanText),
                    );
                  }),
                  20.height(),
                  Text(
                    "Loan Document (optional)",
                    style: AppTheme.headerStyle(),
                  ),
                  8.height(),
                  Row(
                    children: [
                      TextButton(
                        onPressed: () {
                          state.uploadedDocument = 'hello';
                        },
                        child: Text(
                          'Upload Document (pdf, image)',
                          style: AppTheme.titleStyle(color: primaryColor),
                        ),
                      ),
                      const Spacer(),
                      if (state.uploadedDocument != null)
                        const Icon(
                          Icons.check_circle,
                          color: greenColor,
                        )
                    ],
                  ),
                  20.height(),
                  Row(
                    children: [
                      Text(
                        "Loan Amount",
                        style: AppTheme.headerStyle(),
                      ),
                      const Spacer(),
                      Text(
                        "Loan Currency",
                        style: AppTheme.headerStyle(),
                      ),
                    ],
                  ),
                  8.height(),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                          state.loanAmountController,
                          hint: 'Loan Amount',
                          keyboardType: TextInputType.number,
                          password: false,
                          border: Border.all(color: greyColor),
                        ),
                      ),
                      30.width(),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            showCurrencyPicker(
                              context: context,
                              showFlag: true,
                              showCurrencyName: true,
                              showCurrencyCode: true,
                              onSelect: (Currency currency) {
                                state.selectedCurrency = currency;
                              },
                            );
                          },
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: greyColor),
                                color: whiteColor),
                            height: 50,
                            child: Text(state.selectedCurrency == null
                                ? 'Currency'
                                : '${state.selectedCurrency!.code} - ${state.selectedCurrency!.symbol}'),
                          ),
                        ),
                      )
                    ],
                  ),
                  20.height(),
                  Row(
                    children: [
                      Text(
                        "Incurred Date",
                        style: AppTheme.headerStyle(),
                      ),
                      const Spacer(),
                      Text(
                        "Due Date",
                        style: AppTheme.headerStyle(),
                      ),
                    ],
                  ),
                  8.height(),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                          state.loanAmountController,
                          hint: 'Incurred Date',
                          keyboardType: TextInputType.number,
                          password: false,
                          onTap: () {
                            ///show date picker
                          },
                          border: Border.all(color: greyColor),
                        ),
                      ),
                      30.width(),
                      Expanded(
                        child: CustomTextField(
                          state.loanAmountController,
                          hint: 'Due Date',
                          keyboardType: TextInputType.number,
                          password: false,
                          onTap: () {
                            ///show date picker
                          },
                          border: Border.all(color: greyColor),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
