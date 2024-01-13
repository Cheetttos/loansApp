import 'package:expense_tracker/config/extensions.dart';
import 'package:expense_tracker/styles/color.dart';
import 'package:expense_tracker/styles/theme.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_text_form_field/flutter_text_form_field.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Login',
                  style: AppTheme.headerStyle(),
                ),
                120.height(),
                CustomTextField(
                  TextEditingController(),
                  hint: 'Email',
                  password: false,
                  border: Border.all(color: greyColor),
                ),
                20.height(),
                CustomTextField(
                  TextEditingController(),
                  hint: 'Password',
                  password: true,
                  border: Border.all(color: greyColor),
                ),
                100.height(),
                TextButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      fixedSize: MaterialStateProperty.resolveWith(
                          (states) => Size(MediaQuery.of(context).size.width, 0)),
                      backgroundColor: MaterialStateColor.resolveWith((states) => primaryColor)),
                  child: Text(
                    'Login',
                    style: AppTheme.titleStyle(color: whiteColor),
                  ),
                ),
                50.height(),
                Text.rich(TextSpan(children: [
                  TextSpan(
                    text: "Don't have an account? ",
                    style: AppTheme.titleStyle(isBold: true),
                  ),
                  TextSpan(
                      text: "Sign Up",
                      style: AppTheme.titleStyle(color: primaryColor, isBold: true),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          context.go('/register_screen');
                        })
                ]))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
