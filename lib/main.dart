import 'package:flutter/material.dart';
import 'package:talabat/src/app_root.dart';
import 'package:talabat/web_service/dio.dart';
import 'package:talabat/web_service/shared_prefrences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();
  runApp(const AppRoot());
}


