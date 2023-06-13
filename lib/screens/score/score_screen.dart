// import 'package:flutter/material.dart';
// import 'package:get_state_manager/get_state_manager.dart';
// import 'package:quiz/constants.dart';
// import 'package:quiz/controllers/question_controller.dart';

// class ScoreScreen extends StatelessWidget {
//   const ScoreScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     QuestionController _questionController = Get.put(QuestionController());
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: Stack(
//         fit: StackFit.expand,
//         children: [
//           Column(
//             children: [
//               Spacer(
//                 flex: 3,
//               ),
//               Text(
//                 "Score",
//                 style: Theme.of(context)
//                     .textTheme
//                     .headlineMedium
//                     ?.copyWith(color: kSecondaryColor),
//               ),
//               Spacer(),
//               Text(
//                 "${_questionController.correctAns}/${_questionController.questions.length}",
//                 style: Theme.of(context)
//                     .textTheme
//                     .headline6
//                     ?.copyWith(color: kSecondaryColor),
//               ),
//               Spacer(
//                 flex: 3,
//               ),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get_state_manager/get_state_manager.dart';
import 'package:quiz/constants.dart';
import 'package:quiz/controllers/question_controller.dart';

class ScoreScreen extends StatelessWidget {
  const ScoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuestionController _questionController = Get.put(QuestionController());

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(
              flex: 3,
            ),
            Text(
              "Score",
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge
                  ?.copyWith(color: kSecondaryColor),
            ),
            Spacer(),
            Text(
              "${_questionController.numOfCorrectAns}/${_questionController.questions.length}",
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium
                  ?.copyWith(color: kSecondaryColor),
            ),
            Spacer(
              flex: 3,
            ),
          ],
        ),
      ),
    );
  }
}
