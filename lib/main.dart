import 'package:flutter/material.dart';
// import 'package:get/get.dart';
import 'package:quiz/screens/quiz/quiz_screen.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:quiz/screens/welcome/welcome_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: QuizScreen(),
    );
  }
}
