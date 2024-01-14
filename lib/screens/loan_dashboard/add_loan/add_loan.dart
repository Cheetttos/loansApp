import 'package:currency_picker/currency_picker.dart';
import 'package:expense_tracker/config/extensions.dart';
import 'package:expense_tracker/enums/enums.dart';
import 'package:expense_tracker/provider/loan/loan_provider.dart';
import 'package:expense_tracker/shared/widgets/custom_button.dart';
import 'package:expense_tracker/shared/widgets/date_picker.dart';
import 'package:expense_tracker/styles/color.dart';
import 'package:expense_tracker/styles/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_text_form_field/flutter_text_form_field.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class AddLoanScreen extends StatefulWidget {
  const AddLoanScreen({super.key});

  @override
  State<AddLoanScreen> createState() => _AddLoanScreenState();
}

class _AddLoanScreenState extends State<AddLoanScreen> {
  final currentDate = DateTime.now();
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
                      value: type,
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
                          state.incurredDateController,
                          hint: 'Incurred Date',
                          keyboardType: TextInputType.number,
                          password: false,
                          onTap: () async {
                            ///show date picker
                            final date = await pickDate(context,
                                firstDate: DateTime(currentDate.year - 1), secondDate: currentDate);

                            if (date != null) {
                              state.incurredDateController.text = date.toString();
                            }
                          },
                          border: Border.all(color: greyColor),
                        ),
                      ),
                      30.width(),
                      Expanded(
                        child: CustomTextField(
                          state.dueDateController,
                          hint: 'Due Date',
                          keyboardType: TextInputType.number,
                          password: false,
                          onTap: () async {
                            ///show date picker
                            final date = await pickDate(context,
                                firstDate: currentDate, secondDate: DateTime(currentDate.year + 150));

                            if (date != null) {
                              state.dueDateController.text = date.toString();
                            }
                          },
                          border: Border.all(color: greyColor),
                        ),
                      ),
                    ],
                  ),
                  20.height(),
                  if (state.selectedLoanType != null)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${state.selectedLoanType == LoanType.LoanOwedByMe ? 'Creditor' : 'Debtor'}  Details",
                          style: AppTheme.headerStyle(),
                        ),
                        10.height(),
                        Text(
                          "Full Name",
                          style: AppTheme.headerStyle(),
                        ),
                        8.height(),
                        CustomTextField(
                          state.creditorOrDebtorNameController,
                          hint: 'Full Name',
                          password: false,
                          border: Border.all(color: greyColor),
                        ),
                        8.height(),
                        Text(
                          "Phone Number",
                          style: AppTheme.headerStyle(),
                        ),
                        8.height(),
                        CustomTextField(
                          state.creditorOrDebtorPhoneNumberController,
                          hint: 'Phone Number',
                          keyboardType: TextInputType.number,
                          password: false,
                          border: Border.all(color: greyColor),
                        ),
                        40.height(),
                        CustomButton(
                          onPressed: () {
                            context.go('/loan_dashboard');
                          },
                          text: 'Send Request',
                        ),
                        40.height(),
                      ],
                    )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
