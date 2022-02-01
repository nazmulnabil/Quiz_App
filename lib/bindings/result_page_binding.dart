import 'package:exp_quiz_app/controllers/question_controller.dart';
import 'package:get/get.dart';

class ResultPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QuestionController>(() => QuestionController(), fenix: true);
  }
}
