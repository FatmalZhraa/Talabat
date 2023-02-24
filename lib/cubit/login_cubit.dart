import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talabat/cubit/login_state.dart';
import 'package:talabat/models/login.dart';
import 'package:talabat/web_service/dio.dart';
import 'package:talabat/web_service/shared_prefrences.dart';
import 'package:talabat/web_service/end_points.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  static LoginCubit get(context) => BlocProvider.of(context);

  UserResponse? loginResponse;
  void login({
    required String email,
    required String password}) {

    emit(LoginLoadingState());
    DioHelper.post( url: loginUrl,data: {"email": email, "password": password},)
        .then((value) {
      print(value.data);
      loginResponse = UserResponse.fromJson(value.data);
      CacheHelper.saveData(
          key: "token", value: loginResponse!.data?.token);
      CacheHelper.saveData(
          key: "Id", value: loginResponse!.data?.id);
      emit(LoginSuccessfulState());

    }).catchError((error) {
      print("login error is: ${error.toString()}");
      if (error is DioError) {
        emit(LoginFailuerState(message: error.response!.data["message"].toString()));
      }
    });
  }
  UserResponse?signupResponse;
  void register({
  required String name,
  required String email,
  required String password,
    required String phone,
  }){
    emit(SignupLoadingState());
   DioHelper.post(
     url: registerurl,
     data: {"firstName": name, "email": email, "password": password,"phone":phone,})
       .then((value) {
         print(value.data);
        signupResponse = UserResponse.fromJson(value.data);
         CacheHelper.saveData(
             key: "token", value: signupResponse!.data.token);
         CacheHelper.saveData(
             key: "Id", value: signupResponse!.data.id);
         emit(LoginSuccessfulState());
   }).catchError((error){
     print("creating user error is: ${error.toString()}");
     if (error is DioError) {
       emit(SignupFailuerState(
           message: error.response!.data["message"].toString()));
     }
   });
   }
}
