import 'package:dio/dio.dart';
import 'package:talabat/web_service/end_points.dart';

class DioHelper {
  static late Dio dio;
  static init(){
    BaseOptions(
      baseUrl:baseUrl,
      receiveDataWhenStatusError: true,
        connectTimeout: Duration(seconds: 5),
        receiveTimeout: Duration(seconds: 3)
    );
  }
       static Future<Response> request(
           {required String url, Map<String, dynamic>? query, String? token}) async
      {
        dio.options.headers ={
          "Content-Type": "application/json",
          if (token != null) "Authorization": 'Bearer $token',
        };
        return await dio.request(
          url,
          queryParameters: query,
        );
      }
  static Future<Response> post( {required String url,
    Map<String, dynamic>? data,
    String? token,
    Map<String, dynamic>? query,}) async
  {
    dio.options.headers ={
      "Content-Type": "application/json",
      if (token != null) "Authorization": 'Bearer $token',
    };
    return await dio.post(
      url,
      queryParameters: query,
      data: data,
    );
  }
  static Future<Response> patch( { required String url,
    Map<String, dynamic>? data,
    String? token,
    Map<String, dynamic>? query,}) async
  {
    dio.options.headers ={
      "Content-Type": "application/json",
      if (token != null) "Authorization": 'Bearer $token',
    };
    return await dio.patch(
      url,
      queryParameters: query,
      data: data,
    );
  }
}