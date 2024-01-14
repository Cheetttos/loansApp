import 'package:currency_picker/currency_picker.dart';
import 'package:expense_tracker/enums/enums.dart';
import 'package:flutter/material.dart';

class LoanProviderImpl extends ChangeNotifier {
  TextEditingController loanNameController = TextEditingController();
  TextEditingController loanAmountController = TextEditingController();
  TextEditingController incurredDateController = TextEditingController();
  TextEditingController dueDateController = TextEditingController();

  //creditor or debtor's controller
  TextEditingController creditorOrDebtorNameController = TextEditingController();
  TextEditingController creditorOrDebtorPhoneNumberController = TextEditingController();

  Currency? _selectedCurrency;

  Currency? get selectedCurrency => _selectedCurrency;

  set selectedCurrency(Currency? currency) {
    _selectedCurrency = currency;
    _updateState();
  }

  //For loan type
  LoanType? _selectedLoanType;
  LoanType? get selectedLoanType => _selectedLoanType;
  set selectedLoanType(LoanType? value) {
    _selectedLoanType = value;
    _updateState();
  }
  //Loan type ends

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
