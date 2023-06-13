import 'package:flutter/material.dart';
import 'package:get_state_manager/get_state_manager.dart';
import 'package:quiz/constants.dart';
import 'package:quiz/controllers/question_controller.dart';
import 'package:quiz/models/questions.dart';
import 'package:quiz/screens/quiz/components/body.dart';

import 'option.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    required this.question,
    Key? key,
  }) : super(key: key);

  final Question? question;

  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());
    return Container(
      margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      padding: EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          Text(
            question?.question ?? '',
            style: Theme.of(context)
                .textTheme
                .headline6
                ?.copyWith(color: kBlackColor),
          ),
          SizedBox(height: kDefaultPadding / 2),
          ...List.generate(
              question?.options?.length ?? 4,
              (index) => Option(
                    text: question?.options?[index] ?? '',
                    index: index,
                    press: () {
                      _controller.checkAns(question!, index);
                    },
                  ))
        ],
      ),
    );
  }
}
