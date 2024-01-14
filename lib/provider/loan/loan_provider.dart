import 'package:currency_picker/currency_picker.dart';
import 'package:flutter/material.dart';

class LoanProviderImpl extends ChangeNotifier {
  TextEditingController loanNameController = TextEditingController();
  TextEditingController loanAmountController = TextEditingController();
  TextEditingController incurredDateController = TextEditingController();
  TextEditingController dueDateController = TextEditingController();

  Currency? _selectedCurrency;

  Currency? get selectedCurrency => _selectedCurrency;

  set selectedCurrency(Currency? currency) {
    _selectedCurrency = currency;
    _updateState();
  }

  int? _selectedLoanType;

  int? get selectedLoanType => _selectedLoanType;

  set selectedLoanType(int? value) {
    _selectedLoanType = value;
    _updateState();
  }

  String? _uploadedDocument;

  String? get uploadedDocument => _uploadedDocument;

  set uploadedDocument(String? doc) {
    _uploadedDocument = doc;
    _updateState();
  }

  _updateState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifyListeners();
    });
  }
}
