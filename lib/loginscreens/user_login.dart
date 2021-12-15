import 'package:flutter/material.dart';

class login_user extends StatelessWidget {
  const login_user({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Center(
        child: Column(
          children: [
            Image.asset("assets/images/cis.png", fit: BoxFit.fill),
            Text(
              "\n \n User Login",
              style: TextStyle(fontSize: 10),
            ),
          ],
        ),
      ),
      drawer: Drawer(),
    );
  }
}
