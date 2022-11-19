import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/utils/constants.dart';
import 'package:quiz_app/widgets/Btn.dart';
import 'package:quiz_app/widgets/HowToUse.dart';
import 'package:quiz_app/widgets/custom_text.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> mappedCategoryList = categoryList
        .map((categoryItem) => Column(
              children: [
                Btn(
                  categoryItem['name'] ?? '',
                  () => Get.toNamed(
                      '/confirmCategory/${categoryItem['id'] ?? ''}'),
                  outlined: true,
                ),
                const SizedBox(
                  height: 10,
                )
              ],
            ))
        .toList();
    return Scaffold(
      body: Container(
          width: double.infinity,
          height: double.infinity,
          color: myColors['white'],
          alignment: Alignment.center,
          padding: const EdgeInsets.all(30),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                CustomText(
                  'Select A Category',
                  size: 24,
                  weight: FontWeight.w600,
                  color: myColors['h1Clr'],
                ),
                const SizedBox(height: 12),
                CustomText(
                  'Select any category of questions you would like to answer',
                  size: 16,
                  weight: FontWeight.w400,
                  color: myColors['text'],
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 29),
                ...mappedCategoryList, // list of categories
                const SizedBox(
                  height: 24,
                ),
                const HowToUse(),
              ],
            ),
          )),
    );
  }
}
