import 'package:expense_tracker/styles/theme.dart';
import 'package:flutter/material.dart';

class ViewLoadScreen extends StatefulWidget {
  const ViewLoadScreen({super.key});

  @override
  State<ViewLoadScreen> createState() => _ViewLoadScreenState();
}

class _ViewLoadScreenState extends State<ViewLoadScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Loan Title', style: AppTheme.headerStyle()),
      ),
    );
  }
}
