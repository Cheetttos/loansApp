import 'package:expense_tracker/config/extensions.dart';
import 'package:expense_tracker/screens/loan_dashboard/local_widget/loan_info_card.dart';
import 'package:expense_tracker/styles/color.dart';
import 'package:expense_tracker/styles/theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoanDashboardScreen extends StatefulWidget {
  const LoanDashboardScreen({super.key});

  @override
  State<LoanDashboardScreen> createState() => _LoanDashboardScreenState();
}

class _LoanDashboardScreenState extends State<LoanDashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Loan",
          style: AppTheme.headerStyle(),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search_outlined),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              //date
              Align(
                alignment: Alignment.center,
                child: Text(
                  '1st Jan 2024',
                  style: AppTheme.headerStyle(),
                ),
              ),
              20.height(),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), border: Border.all(color: greyColor)),
                alignment: Alignment.centerLeft,
                child: IntrinsicHeight(
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    "Total Loaned",
                                    style: AppTheme.headerStyle(),
                                  ),
                                ),
                                const Icon(
                                  Icons.outbond,
                                  color: redColor,
                                ),
                              ],
                            ),
                            Text(
                              "\$ -400,000",
                              style: AppTheme.titleStyle(),
                            ),
                            const Divider(),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    "Total Owed",
                                    style: AppTheme.headerStyle(),
                                  ),
                                ),
                                const Icon(
                                  Icons.outbond,
                                  color: greenColor,
                                ),
                              ],
                            ),
                            Text(
                              "\$ 400,000",
                              style: AppTheme.titleStyle(),
                            ),
                          ],
                        ),
                      ),
                      const VerticalDivider(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Total Balance",
                            style: AppTheme.headerStyle(),
                          ),
                          Text(
                            "\$ 800,000",
                            style: AppTheme.titleStyle(),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),

              30.height(),

              //pending loan view
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Pending Loan",
                    style: AppTheme.headerStyle(),
                  ),
                  15.height(),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(10, (index) {
                        final status = index % 2 == 0 ? true : false;
                        return LoanInfoCard(
                          isLoaned: status,
                          onTap: () {
                            context.push('/view_loan');
                          },
                        );
                      }),
                    ),
                  )
                ],
              ),

              30.height(),

              //completed loan view
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Completed Loan",
                    style: AppTheme.headerStyle(),
                  ),
                  15.height(),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(10, (index) {
                        final status = index % 2 == 0 ? true : false;
                        return LoanInfoCard(
                          isLoaned: status,
                          onTap: () {
                            context.push('/view_loan');
                          },
                        );
                      }),
                    ),
                  )
                ],
              ),

              100.height(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        onPressed: () {
          context.push('/add_loan');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
