import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get_state_manager/get_state_manager.dart';
import 'package:quiz/constants.dart';
import 'package:quiz/controllers/question_controller.dart';
import 'package:quiz/models/questions.dart';
import 'package:quiz/screens/quiz/components/progress_bar.dart';
import 'package:websafe_svg/websafe_svg.dart';

import 'question_card.dart';

class Body extends StatelessWidget {
  const Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    QuestionController _questionController = Get.put(QuestionController());
    return Stack(
      children: [
        SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: ProgressBar(),
              ),
              SizedBox(
                height: kDefaultPadding,
              ),
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  child: Obx(
                    () => Text.rich(TextSpan(
                        text:
                            "Question ${_questionController.questionNumber?.value}",
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(color: kSecondaryColor),
                        children: [
                          TextSpan(
                              text: "/${_questionController.questions.length}",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall
                                  ?.copyWith(color: kSecondaryColor))
                        ])),
                  )),
              Divider(thickness: 3),
              SizedBox(height: kDefaultPadding),
              Expanded(
                child: PageView.builder(
                  // BLOCK TO THE NEXT QUEESTION
                  physics: NeverScrollableScrollPhysics(),
                  controller: _questionController.pageController,
                  onPageChanged: _questionController.updateTheQuestionNum,
                  itemCount: _questionController.questions.length,
                  itemBuilder: (context, index) => QuestionCard(
                    question: _questionController.questions[index],
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
