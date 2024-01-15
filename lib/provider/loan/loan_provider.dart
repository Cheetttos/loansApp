import 'package:currency_picker/currency_picker.dart';
import 'package:expense_tracker/enums/enums.dart';
import 'package:flutter/material.dart';

abstract class LoanProviderUseCase {
  Future<void> addLoan();
  Future<void> viewLoan();
  Future<void> searchLoan();
  Future<void> deleteLoan(String loanId);
  Future<void> updateLoan(String loanId);
}

class LoanProviderImpl extends ChangeNotifier implements LoanProviderUseCase {
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

  ///

  set uploadedDocument(String? doc) {
    _uploadedDocument = doc;
    _updateState();
  }

  ///Create state
  ViewState _viewState = ViewState.Idle;

  ViewState get viewState => _viewState;

  set viewState(ViewState value) {
    _viewState = value;
    _updateState();
  }

  _updateState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifyListeners();
    });
  }

  @override
  Future<void> addLoan() {
    // TODO: implement addLoan
    throw UnimplementedError();
  }

  @override
  Future<void> deleteLoan(String loanId) {
    // TODO: implement deleteLoan
    throw UnimplementedError();
  }

  @override
  Future<void> searchLoan() {
    // TODO: implement searchLoan
    throw UnimplementedError();
  }

  @override
  Future<void> updateLoan(String loanId) {
    // TODO: implement updateLoan
    throw UnimplementedError();
  }

  @override
  Future<void> viewLoan() {
    // TODO: implement viewLoan
    throw UnimplementedError();
  }
}
