import 'package:flutter/material.dart';
// import 'package:get_state_manager/get_state_manager.dart';
import 'package:quiz/controllers/question_controller.dart';
import 'package:quiz/screens/quiz/components/body.dart';
import 'package:websafe_svg/websafe_svg.dart';
import 'package:get/get.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key, Key});

  @override
  Widget build(BuildContext context) {
    QuestionController controller = Get.put(QuestionController());
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20, top: 10),
          child: IconButton(
            // Add the back button icon
            icon: const Icon(Icons.arrow_back),
            iconSize: 30,
            onPressed: () {
              // Handle back button press event
              Navigator.of(context).pop();
            },
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20, top: 10),
            child: TextButton(
              onPressed: controller.nextQuestion,
              child: Text(
                "Skip",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          )
        ],
      ),
      body: Body(),
    );
  }
}
