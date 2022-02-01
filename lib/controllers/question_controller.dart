import 'dart:async';
import 'package:exp_quiz_app/views/result/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../models/Questions.dart';

// We use get package for our state management

class QuestionController extends GetxController {
  PageController _pageController = PageController();
  PageController get pageController => this._pageController;
  List<int> correctAnsList = [];
  int numberOfCorrectAns = 0;
  int currentPage = 1;
  int initialTimerValue = 50;
  RxInt _countDown = 50.obs;

  RxInt get countDown => _countDown;

  set countDown(RxInt value) {
    _countDown = value;
  }

  Timer? _timer;

  set timer(Timer value) {
    _timer = value;
  }

  final List<Question> _questions = sampleData
      .map(
        (question) => Question(
            id: question['id'],
            question: question['question'],
            options: question['options'],
            answer: question['answer_index']),
      )
      .toList();
  List<Question> get questions => this._questions;
  bool _isAnswered = false;
  bool get isAnswered => this._isAnswered;
  int? _correctAns;
  int? get correctAns => this._correctAns;
  int? _selectedAns;
  int? get selectedAns => this._selectedAns;

  RxInt _questionNumber = 1.obs;
  RxInt get questionNumber => this._questionNumber;

  RxInt _numOfCorrectAns = 0.obs;
  RxInt get numOfCorrectAns => this._numOfCorrectAns;

  RxList checkedAnswersList = [].obs;
  RxList selectedAnswersList = [].obs;

  set isAnswered(bool value) {
    _isAnswered = value;
  }

  // called immediately after the widget is allocated memory
  @override
  void onInit() {
    _pageController = PageController();

    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  // // called just before the Controller is deleted from memory
  @override
  void onClose() {
    super.onClose();
    // _animationController!.dispose();
    _pageController.dispose();
    _timer!.cancel();
  }

  void checkAns(Question question, int selectedIndex, questionPosition) {
    // because once user press any option then it will run
    _isAnswered = true;
    _correctAns = question.answer;
    _selectedAns = selectedIndex;

    if (_correctAns == _selectedAns) {
      correctAnsList.add(questionPosition);
      checkedAnswersList.add(questionPosition);
    }
    update();
  }

  void nextQuestion() {
    if (_questionNumber.value != _questions.length) {
      _isAnswered = false;
      if (questionNumber < _questions.length) {
        _questionNumber++;
      }
      _pageController.nextPage(
          duration: Duration(milliseconds: 250), curve: Curves.ease);
    } else {
      showResult();
    }
  }

  void showResult() {
    numberOfCorrectAns = correctAnsList.toSet().toList().length;
    Get.to(() => const ResultScreen());
  }

  set questionNumber(RxInt value) {
    _questionNumber = value;
  }

  set numOfCorrectAns(RxInt value) {
    _numOfCorrectAns = value;
  }

  set pageController(PageController value) {
    _pageController = value;
  }
}
