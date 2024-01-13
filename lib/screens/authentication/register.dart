import 'package:expense_tracker/config/extensions.dart';
import 'package:expense_tracker/styles/color.dart';
import 'package:expense_tracker/styles/theme.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_text_form_field/flutter_text_form_field.dart';
import 'package:go_router/go_router.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Register',
                  style: AppTheme.headerStyle(),
                ),
                120.height(),
                CustomTextField(
                  TextEditingController(),
                  hint: 'Username',
                  password: false,
                  border: Border.all(color: greyColor),
                ),
                20.height(),
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
                    'Register',
                    style: AppTheme.titleStyle(color: whiteColor),
                  ),
                ),
                50.height(),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "Already have an account? ",
                        style: AppTheme.titleStyle(isBold: true),
                      ),
                      TextSpan(
                          text: "Sign In",
                          style: AppTheme.titleStyle(color: primaryColor, isBold: true),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              context.go('/login_screen');
                            })
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
