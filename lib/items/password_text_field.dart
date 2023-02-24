import 'package:flutter/material.dart';
import 'package:validation_textformfield/validation_textformfield.dart';
class PassWordTextField extends StatelessWidget {

  final TextEditingController controller;

  PassWordTextField({required this.controller});

  @override
  Widget build(BuildContext context) {
    return PassWordValidationTextFiled(
      lineIndicator: false,
      obscureText: true,
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(color: Colors.deepOrange, width: 2),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(color: Colors.grey, width:1),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),

          ),
          counterText: '',
          hintStyle: TextStyle(color: Colors.black, fontSize: 18.0)),
      passwordMinError: "Must be more than 5 charater",
      hasPasswordEmpty: "Password is Empty",
      passwordMaxError: "Password to long",
     // passWordUpperCaseError: "at least one Uppercase (Capital)lette",
     // passWordDigitsCaseError: "at least one digit",
     // passwordLowercaseError: "at least one lowercase character",
     // passWordSpecialCharacters: "at least one Special Characters",
      scrollPadding: EdgeInsets.only(left: 60),
      onChanged: (value) {
        // print(value);
      },
      passwordMaxLength: 10,
      passwordMinLength: 5,
    );
  }
}