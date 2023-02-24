import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:talabat/cubit/login_cubit.dart';
import 'package:talabat/cubit/login_state.dart';
import 'package:talabat/items/default_button.dart';
import 'package:talabat/items/default_textform.dart';
import 'package:talabat/items/email_text_field.dart';
import 'package:talabat/items/password_text_field.dart';
import 'package:talabat/navigate/navigate.dart';
import 'package:talabat/screens/home.dart';
class SignupScreeen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();

  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit,LoginState>(
        listener:(context, state) {
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
        builder:(context, state) {
          var cubit = LoginCubit.get(context);

          return Scaffold(
            body: Form(
              key: formKey,
                child: SingleChildScrollView(

                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(color: Colors.deepOrange,borderRadius: BorderRadius.circular(20)),
                        height: 200,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 50,left: 20),
                          child: Text('Sign Up',style: TextStyle(
                            color:Colors.white,fontSize: 50,  )),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                           Row(
                             children: [
                               Text("Name", style: TextStyle(color: Colors.black,),),
                             ],
                           ),
                           AppTextForm(
                                controller: namecontroller),
                            Row(
                              children: [
                                Text("Phone", style: TextStyle(color: Colors.black,),),
                              ],
                            ),

                            AppTextForm(
                                controller: phonecontroller),
                            Row(
                              children: [
                                Text("Email", style: TextStyle(color: Colors.black,),),
                              ],
                            ),
                            EmailTextField(
                                controller: emailController),
                            Row(
                              children: [
                                Text("Password", style: TextStyle(color: Colors.black,),),
                              ],
                            ),
                            PassWordTextField(
                                controller: passwordController),
                            SizedBox(height: 14),
                            (state is SignupLoadingState)
                                ? const Center(child: CircularProgressIndicator())
                                : Container(
                                  width: 300,
                                  child: DefaultButton(
                                  onPress: () {
                                    if (formKey.currentState!.validate()) {
                                      cubit.register(
                                          name: namecontroller.text,
                                          phone: phonecontroller.text,
                                          email: emailController.text,
                                          password: passwordController.text);
                                    }
                                  },
                                  text: "Continue"),
                                ),
                            SizedBox(height: 14),
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
                        ],),
                      ),
                    ],
                  ),
                )),
          );
        },);
  }
}
