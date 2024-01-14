import 'package:flutter/material.dart';

class LoanProviderImpl extends ChangeNotifier {
  TextEditingController loanNameController = TextEditingController();

  int _selectedLoanType = 0;

  int get selectedLoanType => _selectedLoanType;

  set selectedLoanType(int value) {
    _selectedLoanType = value;
    _updateState();
  }

  

  _updateState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifyListeners();
    });
  }
}
