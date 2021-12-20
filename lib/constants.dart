import 'package:flutter/material.dart';

showAlertDialog(BuildContext context,
    {required Text buttontext,
    required Text titletext,
    required VoidCallback onbuttonPressed,
    required Widget content,
    bool barrierDismisable = false}) {
  // set up the button
  Widget okButton = TextButton(
    child: buttontext,
    onPressed: onbuttonPressed,
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: titletext,
    content: content,
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    barrierDismissible: barrierDismisable,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
