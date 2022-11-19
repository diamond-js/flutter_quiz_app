import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/screens/CategoryScreen/category_screen.dart';
import 'package:quiz_app/screens/ConfirmCategoryScreen/ConfirmCategoryScreen.dart';
import 'package:quiz_app/screens/HomeScreen/home_screen.dart';
import 'package:quiz_app/screens/ScoreScreen/score_screen.dart';
import 'package:quiz_app/screens/TakeQuizScreen/take_quiz_screen.dart';
import 'package:quiz_app/screens/middlewares/middlewares.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Quiz App',
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(name: '/', page: () => const HomeScreen()),
        GetPage(name: '/category', page: () => const CategoryScreen()),
        GetPage(
          name: '/confirmCategory/:categoryID',
          page: () => ConfirmCategoryScreen(),
          middlewares: [
            ConfirmCategoryGuard(),
          ],
        ),
        GetPage(
          name: '/takequiz/:categoryID',
          page: () => const TakeQuizScreen(),
          middlewares: [
            ConfirmCategoryGuard(),
            TakeQuizGuard(),
          ],
        ),
        GetPage(
          name: '/scores/:categoryID',
          page: () => const ScoreScreen(),
          middlewares: [
            ConfirmCategoryGuard(),
          ],
        ),
      ],
    );
  }
}
