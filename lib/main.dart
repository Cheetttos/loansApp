import 'package:expense_tracker/config/router.dart';
import 'package:expense_tracker/provider/loan/loan_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoanProviderImpl()),
      ],
      child: MaterialApp.router(
        routerConfig: router,
      ),
    );
  }
}
