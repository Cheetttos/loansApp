import 'package:expense_tracker/styles/color.dart';
import 'package:expense_tracker/styles/theme.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function() onPressed;
  final String text;
  const CustomButton({super.key, required this.onPressed, this.text = 'Continue'});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
          fixedSize:
              MaterialStateProperty.resolveWith((states) => Size(MediaQuery.of(context).size.width, 0)),
          backgroundColor: MaterialStateColor.resolveWith((states) => primaryColor)),
      child: Text(
        text,
        style: AppTheme.titleStyle(color: whiteColor),
      ),
    );
  }
}
