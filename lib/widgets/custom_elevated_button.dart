import 'package:flutter/material.dart';

import '../theme_colors.dart';

class ElevatedCustomButton extends StatelessWidget {
  String? text;
  double? fontsize;
  double buttonHeight;
  var function;
  ElevatedCustomButton(
      {this.text,
      this.fontsize,
      required this.buttonHeight,
      this.function,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          primary: ThemeColors.baseThemeColor,
        ),
        onPressed: function,

        //  Get.to(QuestionPage(), binding: QuestionPageBinding())),

        child: Padding(
          padding: EdgeInsets.symmetric(vertical: buttonHeight),
          child: Text(
            text!,
            style: TextStyle(
                color: ThemeColors.whiteTextColor, fontSize: fontsize),
          ),
        ));
  }
}
