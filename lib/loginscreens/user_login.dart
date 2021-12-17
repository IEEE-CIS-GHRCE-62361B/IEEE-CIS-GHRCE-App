import 'package:cis_office/loginscreens/register_user.dart';
import 'package:cis_office/user/home_user.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

import '../helper.dart';
import 'authentication_service.dart';

class login_user extends StatelessWidget {
  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Text("\n"),
              Image.asset("assets/images/cis.png", fit: BoxFit.fill),
              Padding(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  controller: emailTextController,
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
                child: TextFormField(
                  controller: passwordTextController,
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
                  context
                      .read<AuthenticationService>()
                      .signIn(
                        email: emailTextController.text.trim(),
                        password: passwordTextController.text.trim(),
                      )
                      .then((String? result) => showSnackbar(context, result!));
                },
                child: Text("Login"),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext) => register_user(),
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
      ),
      drawer: Drawer(),
    );
  }
}
