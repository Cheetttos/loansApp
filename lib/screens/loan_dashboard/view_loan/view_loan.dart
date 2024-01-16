import 'package:expense_tracker/config/extensions.dart';
import 'package:expense_tracker/enums/enums.dart';
import 'package:expense_tracker/provider/loan/loan_provider.dart';
import 'package:expense_tracker/screens/loan_dashboard/local_widget/loan_view_details_card.dart';
import 'package:expense_tracker/shared/utils/message.dart';
import 'package:expense_tracker/shared/widgets/busy_overlay.dart';
import 'package:expense_tracker/shared/widgets/custom_button.dart';
import 'package:expense_tracker/styles/color.dart';
import 'package:expense_tracker/styles/theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ViewLoadScreen extends StatefulWidget {
  final String loanId;
  const ViewLoadScreen({super.key, required this.loanId});

  @override
  State<ViewLoadScreen> createState() => _ViewLoadScreenState();
}

class _ViewLoadScreenState extends State<ViewLoadScreen> {
  @override
  void initState() {
    super.initState();

    Provider.of<LoanProviderImpl>(context, listen: false).viewLoanById(widget.loanId);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LoanProviderImpl>(builder: (context, stateModel, child) {
      return BusyOverlay(
        show: stateModel.viewState == ViewState.Busy,
        title: stateModel.message,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Loan Details', style: AppTheme.headerStyle()),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //loan name
                  const LoanViewDetailsCard(
                    titleText: 'Emergency loan',
                    headerText: 'Loan Name',
                  ),

                  const LoanViewDetailsCard(
                    titleText: 'Emergency loan',
                    headerText: 'Loan Description',
                  ),

                  const LoanViewDetailsCard(
                    titleText: '\$ 50,000',
                    headerText: 'Loan Amount',
                  ),

                  Text(
                    "Loan Document",
                    style: AppTheme.headerStyle(),
                  ),

                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "View Document",
                      style: AppTheme.titleStyle(color: primaryColor),
                    ),
                  ),
                  15.height(),

                  const Row(
                    children: [
                      LoanViewDetailsCard(
                        headerText: 'Incured Date',
                        titleText: '1st Jan 2024',
                      ),
                      Spacer(),
                      LoanViewDetailsCard(
                        headerText: 'Due Date',
                        titleText: '1st Jan 2024',
                      ),
                    ],
                  ),
                  10.height(),
                  const Divider(),
                  10.height(),

                  Text(
                    "Creditor Details",
                    style: AppTheme.headerStyle(),
                  ),

                  const Divider(),

                  10.height(),
                  const LoanViewDetailsCard(
                    headerText: 'Full Name',
                    titleText: 'Destiny Ed',
                  ),
                  const LoanViewDetailsCard(
                    headerText: 'Phone Number',
                    titleText: '+234 8161215190',
                  ),
                  50.height(),
                  //
                  Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                          onPressed: () async {
                            await stateModel.deleteLoan(widget.loanId);

                            if (stateModel.viewState == ViewState.Error) {
                              if (context.mounted) {
                                showMessage(context, stateModel.message, isError: true);
                              }
                              return;
                            }
                            if (stateModel.viewState == ViewState.Success) {
                              if (context.mounted) {
                                showMessage(context, stateModel.message);
                                context.go('/loan_dashboard');
                              }
                            }
                          },
                          text: 'Delete',
                          width: 0,
                        ),
                      ),
                      20.width(),
                      Expanded(
                        child: CustomButton(
                          onPressed: () async {
                            ///success
                            await stateModel.updateLoan(widget.loanId);

                            if (stateModel.viewState == ViewState.Error) {
                              if (context.mounted) {
                                showMessage(context, stateModel.message, isError: true);
                              }
                              return;
                            }
                            if (stateModel.viewState == ViewState.Success) {
                              if (context.mounted) {
                                showMessage(context, stateModel.message);
                                context.go('/loan_dashboard');
                              }
                            }
                          },
                          width: 0,
                          text: 'Mark as Completed',
                        ),
                      ),
                    ],
                  ),
                  50.height()
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
