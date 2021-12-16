import 'package:cis_office/loginscreens/user_login.dart';
import 'package:flutter/material.dart';
import 'loginscreens/register_user.dart';
import 'user/home_user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/": (context) => login_user(),
        "/home": (context) => home_user(),
        "/register": (context) => register_user(),
      },
    );
  }
}
