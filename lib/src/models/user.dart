import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class User {
  String name;
  String? imageUrl;
  String token;

  User({required this.name, this.imageUrl, required this.token});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      imageUrl: json['imageUrl'],
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'imageUrl': imageUrl,
        'token': token,
      };
}

// Save user to shared preferences
void saveUser(User user) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('user', jsonEncode(user.toJson()));
}

Future<User?> getUser() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? jsonStr = prefs.getString('user');
  if (jsonStr == null) {
    return null;
  }
  Map<String, dynamic> json = jsonDecode(jsonStr);
  return User.fromJson(json);
}
