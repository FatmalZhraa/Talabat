import 'package:flutter/material.dart';
import 'package:intro_screen_onboarding_flutter/introduction.dart';
import 'package:intro_screen_onboarding_flutter/introscreenonboarding.dart';
import 'package:talabat/screens/login_screen.dart';
class OnboardingPage extends StatelessWidget {
  final List<Introduction> list = [
    Introduction(

      title: 'Online Order',
      subTitle: 'Browse the menu and order directly from the application',
      subTitleTextStyle: TextStyle(fontSize: 15),
      imageUrl: 'images/onlineorder.jpg',
    ),
    Introduction(
      title: 'Receive Money',
      subTitle: 'Your order will be immediately collected and',
      subTitleTextStyle: TextStyle(fontSize: 15),
      imageUrl: 'images/easypayment.jpg',
    ),
    Introduction(
      title: 'Fast Delivery',
      subTitle: 'Pick up delivery at your door and enjoy groceries',
      subTitleTextStyle: TextStyle(fontSize: 15),
      imageUrl: 'images/fast delivary.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return IntroScreenOnboarding(

      introductionList: list,
      backgroudColor: Colors.white,
      foregroundColor: Colors.deepOrange,
      skipTextStyle:TextStyle( color: Colors.deepOrange,fontSize: 24),
      onTapSkipButton: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LoginScreen(),
          ), //MaterialPageRoute
        );
      },
    );
  }
}
