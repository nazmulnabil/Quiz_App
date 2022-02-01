import 'package:exp_quiz_app/constants/app_colors.dart';
import 'package:exp_quiz_app/constants/app_values.dart';
import 'package:exp_quiz_app/constants/size_config.dart';
import 'package:exp_quiz_app/controllers/question_controller.dart';
import 'package:exp_quiz_app/views/authentication/sign_in.dart';
import 'package:exp_quiz_app/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: double.infinity,
            child: Text(
              "Congratulations!",
              textAlign: TextAlign.center,
              style: TextStyle(
                //color: Colors.white,
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 45.0,
          ),
          const Text(
            "No of question",
            style: TextStyle(
                //color: Colors.white,
                fontSize: 34.0),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Text(
            "${Get.find<QuestionController>().questions.length}",
            style: const TextStyle(
              color: AppColors.colorPrimarySwatch,
              fontSize: 85.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            "No of correct answer",
            style: TextStyle(
                //color: Colors.white,
                fontSize: 34.0),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Text(
            "${Get.find<QuestionController>().numberOfCorrectAns}",
            style: const TextStyle(
              color: AppColors.colorPrimarySwatch,
              fontSize: 85.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: AppValues.padding),
            margin: const EdgeInsets.only(
              top: AppValues.margin_30,
            ),
            width: SizeConfig.screenWidth,
            child: ElevatedCustomButton(
              text: "Repeat the quizz",
              function: () {
                Get.find<QuestionController>().isAnswered = false;
                Get.find<QuestionController>().questionNumber.value = 1;
                Get.find<QuestionController>().correctAnsList.clear();
                Get.find<QuestionController>().checkedAnswersList.clear();
                Get.find<QuestionController>().pageController =
                    PageController();
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => SignIn()));
              },
              fontsize: AppValues.fontSizelarge,
              buttonHeight: AppValues.padding,
            ),
          )
        ],
      ),
    );
  }
}
