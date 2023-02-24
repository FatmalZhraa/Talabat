import 'package:flutter/material.dart';
class DefaultButton extends StatelessWidget {
  Function onPress;
  String text;

  DefaultButton({required this.onPress,required this.text});
  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(

        child:  Text( text , style: TextStyle(fontSize: 20),),

    onPressed: () {
    onPress();
    },
    style: ElevatedButton.styleFrom(
    backgroundColor: Colors.deepOrange,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)),
    )
    );
  }
}
