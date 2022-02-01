import 'package:exp_quiz_app/views/authentication/sign_in.dart';
import 'package:exp_quiz_app/views/quiz/question_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:exp_quiz_app/bindings/question_page_binding.dart';

import 'bindings/sign_in_binding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FoodBank',
      theme: ThemeData(),
      initialRoute: "/",
      getPages: [
        GetPage(name: "/", page: () => SignIn(), binding: SignInPageBinding()),
        GetPage(
            name: "/question",
            page: () => QuestionPage(),
            binding: QuestionPageBinding())
      ],
    );
  }
}
