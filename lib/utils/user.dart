import 'package:shared_preferences/shared_preferences.dart';
import '../constants/storage.dart';

Future<LocalStorage?> getUserFromLocalStorage() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final String? token = await prefs.getString(localStorage.token);
  final String? userId = prefs.getString(localStorage.userId);
  if (token != null && userId != null) {
    return LocalStorage(token: token, userId: userId);
  }

  return null;
}

void setUserInLocalStorage(String userId, String token) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString(localStorage.userId, "userId");
  await prefs.setString(localStorage.token, "token");
}

void removeUserFromLocalStorage() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove(localStorage.token);
  await prefs.remove(localStorage.userId);
}
