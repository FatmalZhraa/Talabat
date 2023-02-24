import 'package:flutter/material.dart';
class Navigation {
  static void navigateTo({
    required BuildContext context,
    required Widget nextScreen,
  }) =>
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => nextScreen),
      );

  static void navigateAndClearStack({
    required BuildContext context,
    required Widget destinationScreen,
  }) =>
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => destinationScreen,
        ),
            (Route<dynamic> route) => false,
      );
}