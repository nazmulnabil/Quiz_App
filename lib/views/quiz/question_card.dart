import 'package:exp_quiz_app/controllers/question_controller.dart';
import 'package:exp_quiz_app/models/Questions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants.dart';
import 'option.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard(
      {Key? key,
      // it means we have to pass this
      required this.question,
      required this.questionPosition})
      : super(key: key);

  final Question question;
  final int questionPosition;

  @override
  Widget build(BuildContext context) {
    //QuestionController _controller = Get.put(QuestionController());
    return Container(
      // margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      padding: const EdgeInsets.all(kDefaultPadding),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      child: Column(
        children: [
          Text(
            question.question.toString(),
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(color: kBlackColor),
          ),
          const SizedBox(height: kDefaultPadding / 2),
          ...List.generate(
            question.options!.length,
            (index) => Option(
              // questionPosition: questionPosition,
              index: index,
              text: question.options![index],
              press: () => Get.find<QuestionController>()
                  .checkAns(question, index, questionPosition),
            ),
          ),

          //buttons
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
