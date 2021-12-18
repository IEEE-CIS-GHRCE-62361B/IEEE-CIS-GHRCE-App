import 'package:flutter/material.dart';

class new_event extends StatelessWidget {
  const new_event({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("New Event"),
      ),
    );
  }
}
