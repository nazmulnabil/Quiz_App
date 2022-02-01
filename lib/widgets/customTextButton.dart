import 'package:flutter/material.dart';

import '../theme_colors.dart';

class TextCustomButton extends StatelessWidget {
  String? text;
  double? fontsize;
  double buttonHeight;
  var function;
  TextCustomButton(
      {this.text,
      this.fontsize,
      required this.buttonHeight,
      this.function,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: function,

        //  Get.to(QuestionPage(), binding: QuestionPageBinding())),

        child: Padding(
          padding: EdgeInsets.symmetric(vertical: buttonHeight),
          child: Text(
            text!,
            style: TextStyle(
                color: ThemeColors.baseThemeColor, fontSize: fontsize),
          ),
        ));
  }
}
