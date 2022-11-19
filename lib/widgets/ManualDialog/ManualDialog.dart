import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:quiz_app/utils/constants.dart';
import 'package:quiz_app/widgets/Btn.dart';
import 'package:quiz_app/widgets/ManualDialog/widgets/about_section.dart';
import 'package:quiz_app/widgets/ManualDialog/widgets/how_to_use_section.dart';
import 'package:quiz_app/widgets/custom_text.dart';

class ManualDialog extends StatefulWidget {
  const ManualDialog({Key? key, this.openAboutAsActiveNav = false})
      : super(key: key);
  final bool openAboutAsActiveNav;
  @override
  State<ManualDialog> createState() => _ManualDialogState();
}

class _ManualDialogState extends State<ManualDialog> {
  bool showAbout = false;

  @override
  void initState() {
    super.initState();
    showAbout = widget.openAboutAsActiveNav;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0x40000000),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Align(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: const Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.circular(12)),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: GestureDetector(
                          onTap: () => setState(() {
                            showAbout = true;
                          }),
                          child: AnimatedContainer(
                            clipBehavior: Clip.hardEdge,
                            duration: const Duration(milliseconds: 200),
                            decoration: BoxDecoration(
                              color: showAbout
                                  ? const Color(0xFFDBE8FA)
                                  : const Color(0x00DBE8FA),
                            ),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: CustomText(
                                    'About',
                                    size: 20,
                                    weight: FontWeight.w600,
                                    color: showAbout
                                        ? const Color(0xFF344867)
                                        : const Color(0xFF697485),
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  left: 0,
                                  right: 0,
                                  child: Align(
                                    alignment: Alignment.topRight,
                                    child: AnimatedFractionallySizedBox(
                                      duration:
                                          const Duration(milliseconds: 200),
                                      widthFactor: showAbout ? 1 : 0,
                                      child: Container(
                                        height: 2,
                                        color: myColors['prim'],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () => setState(() {
                            showAbout = false;
                          }),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            decoration: BoxDecoration(
                              color: !showAbout
                                  ? const Color(0xFFDBE8FA)
                                  : const Color(0x00DBE8FA),
                            ),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: CustomText(
                                    'How To Use',
                                    size: 20,
                                    weight: FontWeight.w600,
                                    color: !showAbout
                                        ? const Color(0xFF344867)
                                        : const Color(0xFF697485),
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  left: 0,
                                  right: 0,
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: AnimatedFractionallySizedBox(
                                      duration:
                                          const Duration(milliseconds: 200),
                                      widthFactor: !showAbout ? 1 : 0,
                                      child: Container(
                                        height: 2,
                                        color: myColors['prim'],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  showAbout ? const AboutSection() : const HowToUseSection(),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Btn('Close', () => Get.back()),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
