import 'package:flutter/material.dart';
class AppTextForm extends StatelessWidget {

  final TextEditingController controller;

  AppTextForm({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(color: Colors.deepOrange, width: 2),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),

              borderSide: BorderSide(color: Colors.grey, width: 1),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            counterText: '',
            hintStyle: TextStyle(color: Colors.black, fontSize: 18.0)),
      ),
    );
  }
}
