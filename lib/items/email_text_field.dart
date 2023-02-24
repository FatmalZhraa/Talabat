import 'package:flutter/material.dart';
import 'package:validation_textformfield/validation_textformfield.dart';
class EmailTextField extends StatelessWidget {
  final TextEditingController controller;

  EmailTextField({required this.controller});

  @override
  Widget build(BuildContext context) {
    return  EmailValidationTextField(
    whenTextFieldEmpty: "Please enter  email",
    validatorMassage: "Please enter valid email",
    decoration: InputDecoration(
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(25),
    borderSide: BorderSide(color: Colors.deepOrange, width: 2),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(25),
      borderSide: BorderSide(color: Colors.black, width: 1),
    ),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(25),
    ),
    counterText: '',
    hintStyle: TextStyle(color: Colors.black, fontSize: 18.0)),
    );
  }
}
