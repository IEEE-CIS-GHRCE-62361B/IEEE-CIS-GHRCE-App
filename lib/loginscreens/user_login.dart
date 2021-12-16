import 'package:cis_office/user/home_user.dart';
import 'package:flutter/material.dart';

class login_user extends StatelessWidget {
  const login_user({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Center(
        child: Column(
          children: [
            Text("\n"),
            Image.asset("assets/images/cis.png", fit: BoxFit.fill),
            Text(
              "\n \n User Login",
              style: TextStyle(fontSize: 10),
            ),
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
              onPressed: () {},
              child: Text("Login"),
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext) => home_user(),
                    ),
                  );
                },
                child: Text("Don't have an account? Create New")),
            TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext) => home_user(),
                    ),
                  );
                },
                child: Text("Organizers Login")),
          ],
        ),
      ),
      drawer: Drawer(),
    );
  }
}
