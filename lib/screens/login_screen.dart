import 'package:flutter/material.dart';
import 'package:talabat/cubit/login_cubit.dart';
import 'package:talabat/cubit/login_state.dart';
import 'package:talabat/items/default_button.dart';
import 'package:talabat/items/email_text_field.dart';
import 'package:talabat/items/password_text_field.dart';
import 'package:talabat/navigate/navigate.dart';
import 'package:talabat/screens/home.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talabat/screens/signup.dart';

class LoginScreen extends StatelessWidget {

  final formKey = GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer <LoginCubit,LoginState>(

      listener: (context, state) {
        // TODO: implement listener
        if (state is LoginSuccessfulState) {
          Navigation.navigateAndClearStack(
              context: context, destinationScreen: HomePage());
        } else if (state is LoginFailuerState) {
          Fluttertoast.showToast(
            msg: state.message!,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0
          );
        }
      },
    builder: (context, state) {
      var cubit = LoginCubit.get(context);
      return Scaffold(
        body: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset('images/login.png', ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      SizedBox(height: 14),
                      Row(
                        children: [
                          Text("Email", style: TextStyle(color: Colors.black,),),
                        ],
                      ),
                      EmailTextField(controller: emailController,
                      ),

                      Row(
                        children: [
                          Text("Password", style:TextStyle(color: Colors.black,),),
                        ],
                      ),
                      PassWordTextField(
                          controller: passwordController),
                      (state is LoginLoadingState)
                          ? const Center(child: CircularProgressIndicator(color: Colors.deepOrange,)):
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: 330,
                          child: DefaultButton(text: 'Login',
                              onPress:(){
                                if (formKey.currentState!.validate()) {
                                  cubit.login(
                                      email: emailController.text,
                                      password: passwordController.text);
                                }
                              } ,
                          ),
                        ),
                      ),

                      TextButton(
                          onPressed:(){
                            Navigation.navigateTo(context: context, nextScreen: SignupScreeen(),);
                          },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Don't have an account? ",style: TextStyle(color: Colors.grey,fontSize: 17,)),
                            Text('Sign up',style: TextStyle(color: Colors.deepOrange,fontSize: 19,)),
                          ],
                        ),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Tab(
                            icon: Container(
                              child: Image(
                                height: 45,
                                width: 40,
                                image: AssetImage(
                                  'images/google.png',
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Tab(
                            icon: Container(
                              child: Image(
                                height: 45,
                                width: 40,
                                image: AssetImage(
                                  'images/facebook.png',
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
    );
  }
}


