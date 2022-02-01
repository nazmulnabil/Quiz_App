import 'package:exp_quiz_app/constants/app_values.dart';
import 'package:exp_quiz_app/controllers/question_controller.dart';
import 'package:exp_quiz_app/theme_colors.dart';
import 'package:exp_quiz_app/views/quiz/question_card.dart';
import 'package:exp_quiz_app/widgets/alert_dialogue.dart';
import 'package:exp_quiz_app/widgets/custom_elevated_button.dart';
import 'package:exp_quiz_app/widgets/custom_elevated_outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/size_config.dart';

class QuestionPage extends StatelessWidget {
  const QuestionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig sizeConfig = SizeConfig();
    sizeConfig.init(context);

    return Scaffold(
        backgroundColor: ThemeColors.off_white_Color,
        body: Stack(
          children: [
            SizedBox(
              height: SizeConfig.screenHeight,
              width: SizeConfig.screenWidth,
              child: Column(
                children: [
                  Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    color: ThemeColors.baseThemeColor,
                    padding:
                        const EdgeInsets.only(top: 60, left: 20, right: 20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Obx(
                              () => Text(
                                  'Question ${Get.find<QuestionController>().questionNumber}'
                                  '/${Get.find<QuestionController>().questions.length}',
                                  style: const TextStyle(
                                      color: ThemeColors.whiteTextColor)),
                            ),
                          ],
                        ),
                        Expanded(
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount:
                                Get.find<QuestionController>().questions.length,
                            itemBuilder: (context, index) => Padding(
                              padding: const EdgeInsets.only(
                                  top: 30, bottom: 60, left: 3, right: 3),
                              child: InkWell(
                                onTap: (() {}),
                                child: Obx(() => Container(
                                      decoration: BoxDecoration(
                                          color: Get.find<QuestionController>()
                                                  .checkedAnswersList
                                                  .contains(index)
                                              ? Colors.green
                                              : Colors.grey,
                                          border: Border.all(
                                              width: 0,
                                              color:
                                                  ThemeColors.baseThemeColor),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20))),
                                      width: 30,
                                      child: Center(
                                          child: Text(
                                        "${index + 1}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500),
                                      )),
                                    )),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            //question container
            Positioned(
              left: 15,
              right: 15,
              bottom: 0,
              top: SizeConfig.screenHeight! / 4.5,
              child: PageView.builder(
                // Block swipe to next qn

                physics: const NeverScrollableScrollPhysics(),
                controller: Get.find<QuestionController>().pageController,
                //onPageChanged: Get.find<QuestionController>().updateTheQnNum,
                itemCount: Get.find<QuestionController>().questions.length,
                itemBuilder: (context, index) => QuestionCard(
                  question: Get.find<QuestionController>().questions[index],
                  questionPosition: index,
                ),
              ),
            ),

            Positioned(
              left: 30,
              right: 30,
              bottom: 0,
              child: Column(
                children: [
                  Container(
                    //  height: AppValues.padding,
                    width: SizeConfig.screenWidth,
                    margin: const EdgeInsets.only(bottom: AppValues.margin_10),
                    // padding: EdgeInsets.all(kDefaultPadding),
                    decoration: BoxDecoration(
                      //  border: Border.all(color: getTheRightColor()),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ElevatedCustomButton(
                      function: () {
                        Get.find<QuestionController>().nextQuestion();
                      },
                      text: "Next Question",
                      fontsize: AppValues.fontSizelarge,
                      buttonHeight: AppValues.padding,
                    ),
                  ),
                  //go to result screen
                  Container(
                    //  height: AppValues.padding,
                    width: SizeConfig.screenWidth,
                    margin: const EdgeInsets.only(bottom: AppValues.margin_10),
                    // padding: EdgeInsets.all(kDefaultPadding),
                    decoration: BoxDecoration(
                      //  border: Border.all(color: getTheRightColor()),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: OutlinedCustomButton(
                      function: () {
                        showAlertDialog(
                            context,
                            "Are you sure you have finished your answers?",
                            "Press yes to see your result.");
                      },
                      text: "Finish",
                      fontsize: AppValues.fontSizelarge,
                      buttonHeight: AppValues.padding,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
