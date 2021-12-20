import 'package:cis_office/loginscreens/user_login.dart';
import 'package:cis_office/user/home_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

import '../constants.dart';
import '../helper.dart';
import 'authentication_service.dart';

class register_user extends StatefulWidget {
  @override
  State<register_user> createState() => _register_userState();
}

class _register_userState extends State<register_user> {
  final databaseReference = FirebaseFirestore.instance;
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void userExists() {
    FirebaseFirestore.instance
        .collection('users')
        .doc(_emailTextController.text)
        .get()
        .then(
      (DocumentSnapshot documentSnapshot) async {
        if (documentSnapshot.exists) {
          showAlertDialog(context, buttontext: Text('Login'),
              onbuttonPressed: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => login_user()));
          },
              titletext: Text("USER ALREADY EXISTS"),
              content: Text("Please Login.. Taking you to Login Page "));
        } else {
          final result = await context.read<AuthenticationService>().signUp(
                email: _emailTextController.text.trim(),
                password: _passwordTextController.text.trim(),
              );

          if (result == "Signed up") {
            await createRecord().then(
              (value) => Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (BuildContext) => home_user(),
                ),
                (Route<dynamic> route) => false,
              ),
            );
          } else {
            showSnackbar(context, result!);
          }
        }
      },
    );
  }

  Future<void> createRecord() async {
    await databaseReference
        .collection("users")
        .doc(_emailTextController.text)
        .set(
      {
        'Email': _emailTextController.text,
        'uid': FirebaseAuth.instance.currentUser!.uid,
        'isAdmin': false,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Register"),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Image.asset("assets/images/cis.png", fit: BoxFit.fill),
              Padding(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Email can't be empty";
                    }
                    return null;
                  },
                  controller: _emailTextController,
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Password can't be empty";
                    }
                    return null;
                  },
                  controller: _passwordTextController,
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
                onPressed: () async {
                  userExists();
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
      ),
    );
  }
}
