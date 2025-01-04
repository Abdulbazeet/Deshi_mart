import 'package:shared_preferences/shared_preferences.dart';

class Shared {
 static Future<String> getToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString("authToken") ?? "";
  }
}
