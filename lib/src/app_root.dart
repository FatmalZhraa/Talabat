import 'package:flutter/material.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import 'package:talabat/cubit/login_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talabat/screens/onboardingscreene.dart';
class AppRoot extends StatelessWidget {
  const AppRoot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget example1 = SplashScreenView(
      navigateRoute: OnboardingPage(),
      duration: 4000,
      imageSize: 65,
      imageSrc: "images/logo.png",
       text: "Loading...",
      textStyle: TextStyle(color: Colors.deepOrange,fontSize: 20),
    );
    return MultiBlocProvider(
        providers: [BlocProvider(create: (BuildContext context) => LoginCubit()),],
        child: MaterialApp(home: example1,));
  }
}



