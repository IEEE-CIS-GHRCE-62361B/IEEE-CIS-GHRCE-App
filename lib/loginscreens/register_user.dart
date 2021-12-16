import 'package:cis_office/loginscreens/user_login.dart';
import 'package:cis_office/user/home_user.dart';
import 'package:flutter/material.dart';

class register_user extends StatelessWidget {
  const register_user({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Register"),
      ),
      body: Center(
        child: Column(
          children: [
            Text("\n"),
            Image.asset("assets/images/cis.png", fit: BoxFit.fill),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                onChanged: (value) {},
                decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(
                      color: Colors.black,
                    ),
                    border: OutlineInputBorder(),
                    hintText: "abc@xyz.com"),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                onChanged: (value) {},
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(
                    color: Colors.black,
                  ),
                  border: OutlineInputBorder(),
                  hintText: '*******',
                ),
              ),
            ),
            TextButton(onPressed: () {}, child: Text("Forget Password")),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext) => home_user(),
                  ),
                );
              },
              child: Text("Register"),
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext) => login_user(),
                    ),
                  );
                },
                child: Text("Already have an account? Login")),
          ],
        ),
      ),
      drawer: Drawer(),
    );
  }
}
