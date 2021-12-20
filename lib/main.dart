import 'package:cis_office/user/new_event.dart';
import 'package:cis_office/widget/themes.dart';

import 'loginscreens/user_login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'loginscreens/authentication_service.dart';
import 'loginscreens/register_user.dart';
import 'user/home_user.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // 2
        Provider<AuthenticationService>(
          create: (_) => AuthenticationService(FirebaseAuth.instance),
        ),
        // 3
        StreamProvider(
          create: (context) =>
              context.read<AuthenticationService>().authStateChanges,
          initialData: null,
        )
      ],
      child: MaterialApp(
        theme: MyTheme.lightTheme,
        routes: {
          '/': (context) => login_user(),
          '/auth': (context) => AuthenticationWrapper(),
          "/login": (context) => login_user(),
          "/home": (context) => home_user(),
          "/register": (context) => register_user(),
          "/new_event": (context) => new_event(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebaseuser = context.watch<User>();
    if (firebaseuser != null) {
      return home_user();
    }
    return login_user();
  }
}
