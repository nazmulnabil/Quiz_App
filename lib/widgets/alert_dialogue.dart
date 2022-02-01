import 'package:exp_quiz_app/controllers/question_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

showAlertDialog(BuildContext context, String title, String description) {
  // set up the button
  Widget okButton = TextButton(
    child: Text("Yes"),
    onPressed: () {
      Navigator.of(context).pop();
      Get.find<QuestionController>().showResult();
    },
  );

  Widget noButton = TextButton(
    child: Text("No"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(title),
    content: Text(description),
    actions: [okButton, noButton],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
