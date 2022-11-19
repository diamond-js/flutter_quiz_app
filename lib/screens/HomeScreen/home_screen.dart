import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/utils/constants.dart';
import 'package:quiz_app/widgets/Btn.dart';
import 'package:quiz_app/widgets/HowToUse.dart';
import 'package:quiz_app/widgets/containers.dart';
import 'package:quiz_app/widgets/custom_text.dart';
import 'package:quiz_app/widgets/learn_more_tooltip.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  bool showLearnMoreTooltip = true;
  late AnimationController controller;
  late Animation<double> translateXAnimation;
  late CurvedAnimation translateXAnimationCurve;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    translateXAnimationCurve =
        CurvedAnimation(parent: controller, curve: Curves.ease);
    translateXAnimation = Tween<double>(begin: 0, end: 500).animate(
      translateXAnimationCurve,
    );

    super.initState();
  }

  void closeLearnMoreTooltip() {
    controller.addListener(() {
      setState(() {});
    });
    controller.forward();
    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          showLearnMoreTooltip = false;
        });
        controller.reset();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Background(
            child: SafeArea(
              child: WrapperContainer(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    CustomText(
                      'Join Quiz',
                      size: 24,
                      weight: FontWeight.w600,
                      color: myColors['h1Clr'],
                    ),

                    const SizedBox(
                      height: 12,
                    ),
                    // TextSpan( ),
                    CustomText(
                      'Click start Quiz and then select any category of questions you would like to answer',
                      size: 16,
                      weight: FontWeight.w400,
                      color: myColors['text'],
                      textAlign: TextAlign.center,
                    ),

                    const SizedBox(height: 40),
                    Btn('Start Quiz', () {
                      setState(() {
                        // showLearnMoreTooltip = true;
                        Get.toNamed('/category');
                      });
                    }),
                    const SizedBox(height: 30),
                    const HowToUse(),
                  ],
                ),
              ),
            ),
          ),
          showLearnMoreTooltip
              ? Positioned(
                  bottom: 26,
                  right: 22,
                  child: Transform(
                    transform: Matrix4.translationValues(
                        translateXAnimation.value, 0, 0),
                    child: LearnMoreTooltip(
                      onClose: closeLearnMoreTooltip,
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
