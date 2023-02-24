import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper{

  static late SharedPreferences  sharedPrefrences;
     static init() async {
       sharedPrefrences = await SharedPreferences.getInstance();
     }

       static Future saveData ({required String key,required dynamic value}) async {

         if (value is int) await sharedPrefrences.setInt(key, value);
// Save an int value to  key.
         if (value is bool) await sharedPrefrences.setBool(key, value);
// Save an bool value to  key.
         if (value is double) await sharedPrefrences.setDouble(key, value);
// Save an double value to  key.
         if (value is String) await sharedPrefrences.setString(key, value);
// Save an list of strings to key.
         return await sharedPrefrences.setStringList(key, value);

     }
     static dynamic getData ({required String key}) {
       return sharedPrefrences.get(key);
     }

     static Future removeData ({required String key}) async
     {
       // Remove data for the 'counter' key.
       await sharedPrefrences.remove(key);
     }
}