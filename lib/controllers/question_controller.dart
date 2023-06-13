import 'package:flutter/material.dart';
import 'package:get_state_manager/get_state_manager.dart';
import 'package:quiz/models/questions.dart';
import 'package:quiz/screens/score/score_screen.dart';
// import 'package:get/get.dart';

class QuestionController extends GetxController
    with SingleGetTickerProviderMixin {
  late AnimationController _animationController;
  late Animation _animation;
  // so that we can acces our animation outside
  Animation get animation => this._animation;

  PageController? _pageController;
  PageController get pageController => this._pageController!;

  List<Question> _questions = sample_data
      .map(
        (question) => Question(
          id: question["id"],
          question: question["question"],
          options: question["options"],
          answer: question["answer_index"],
        ),
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
  RxInt? get questionNumber => this._questionNumber;

  int _numOfCorrectAns = 0;
  int? get numOfCorrectAns => this._numOfCorrectAns;

  // CALLED IMMEDICATELY AFTER WIDGET IS ALLOCATED MEMORY
  @override
  void onInit() {
    // TODO: implement onInit
    _animationController =
        AnimationController(duration: Duration(seconds: 60), vsync: this);
    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController)
      ..addListener(() {
        update();
      });

    _animationController.forward().whenComplete(nextQuestion);

    _pageController = PageController();

    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    _animationController.dispose();
    _pageController?.dispose();
  }

  void checkAns(Question question, int selectedIndex) {
    _isAnswered = true;
    _correctAns = question.answer;
    _selectedAns = selectedIndex;

    if (_correctAns == _selectedAns) {
      _numOfCorrectAns++;
    }
    _animationController.stop();
    update();

    // AFTER AN ANSWER IS SELECTED THE QUESTION WILL CHANGE IN 3 SECONDS
    Future.delayed(Duration(seconds: 1), () {
      nextQuestion();
    });
  }

  void nextQuestion() {
    if (_questionNumber.value != _questions.length) {
      _isAnswered = false;
      _pageController?.nextPage(
          duration: Duration(milliseconds: 300), curve: Curves.ease);

      // COUNTER RESET
      _animationController.reset();

      // STARTING IT AGAIN
      _animationController.forward().whenComplete(nextQuestion);
    }

    // Get.to(() => const ScoreScreen());
  }

  // void nextQuestion() {
  //   if (_questionNumber.value != _questions.length) {
  //     _isAnswered = false;
  //     _pageController?.nextPage(
  //         duration: Duration(milliseconds: 300), curve: Curves.ease);

  //     // COUNTER RESET
  //     _animationController.reset();

  //     // STARTING IT AGAIN
  //     _animationController.forward().whenComplete(nextQuestion);
  //   } else if (!Get.isOverlaysOpen) {
  //     // check if there is a route to pop
  //     Get.to(ScoreScreen());
  //   }
  // }

  void updateTheQuestionNum(int index) {
    _questionNumber.value = index + 1;
  }
}
