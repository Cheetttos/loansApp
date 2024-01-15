import 'dart:io';

import 'package:expense_tracker/enums/enums.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

abstract class AuthenticationProviderUseCase {
  Future<void> loginUser();
  Future<void> registerUser();
}

class AuthenticationProviderImpl extends ChangeNotifier implements AuthenticationProviderUseCase {
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final firebaseAuth = FirebaseAuth.instance;

  ViewState state = ViewState.Idle;
  String message = '';

  @override
  Future<void> loginUser() async {
    state = ViewState.Busy;
    message = 'Creating your account...';
    _updateState();

    try {
      final result = await firebaseAuth.signInWithEmailAndPassword(
          email: emailController.text.trim(), password: passwordController.text.trim());

      state == ViewState.Success;
      message = 'Welcome back, ${result.user!}';
      _updateState();
    } on SocketException catch (_) {
      state == ViewState.Error;
      message = 'Network error. Please try again later.';
      _updateState();
    } on FirebaseAuthException catch (e) {
      state == ViewState.Error;
      message = e.code;
      _updateState();
    } catch (e) {
      state == ViewState.Error;
      message = 'Error creating account. Please try again later.';
      _updateState();
    }
  }

  @override
  Future<void> registerUser() async {
    state = ViewState.Busy;
    message = 'Creating your account...';
    _updateState();

    try {
      final result = await firebaseAuth.createUserWithEmailAndPassword(
          email: emailController.text.trim(), password: passwordController.text.trim());

      ///set username of user
      result.user!.updateDisplayName(userNameController.text.trim());

      state == ViewState.Success;
      message = 'Welcome, ${userNameController.text}';
      _updateState();
    } on SocketException catch (_) {
      state == ViewState.Error;
      message = 'Network error. Please try again later.';
      _updateState();
    } on FirebaseAuthException catch (e) {
      state == ViewState.Error;
      message = e.code;
      _updateState();
    } catch (e) {
      state == ViewState.Error;
      message = 'Error creating account. Please try again later.';
      _updateState();
    }
  }

  _updateState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifyListeners();
    });
  }
}
