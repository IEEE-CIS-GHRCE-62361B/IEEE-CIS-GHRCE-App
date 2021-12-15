import 'package:flutter/material.dart';

class home_user extends StatelessWidget {
  const home_user({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("IEEE CIS - GHRCE"),
      ),
      body: Center(
        child: Container(
          child: Text("IEEE CIS GHRCE"),
        ),
      ),
      drawer: Drawer(),
    );
  }
}
