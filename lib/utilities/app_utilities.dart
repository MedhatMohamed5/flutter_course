import 'package:shared_preferences/shared_preferences.dart';

Future<bool> isLoggedIn() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  bool isLoggedIn = sharedPreferences.getBool('isLoggedIn');
  if (isLoggedIn == null || !isLoggedIn) return false;

  return true;
}
