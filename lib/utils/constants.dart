import 'package:flutter/material.dart';
import 'package:quiz_app/utils/question.dart';
import 'package:quiz_app/utils/func.dart';

const Map<String, Color> myColors = {
  'text': Color(0xFF2B374A),
  'h1Clr': Color(0xFF2E3A4C),
  'btnClr': Color(0xFF13232F),
  'white': Color(0xFFffffff),
  'grayTxt': Color(0xFF848E9D),
  'prim': Color(0xFF5793EE),
  'optionClr': Color(0xFF22262D),
  'bgGray': Color(0xFFEBEBEB),
  'errorTxt': Color(0xFFD04B4B),
};

const BoxShadow containerShadow = BoxShadow(
  blurRadius: 24,
  offset: Offset(0, 14),
  color: Color.fromRGBO(162, 166, 168, 0.2),
);

const List<Map<String, String>> categoryList = [
  {
    'id': 'computer',
    'name': 'Computer',
  },
  {
    'id': 'general_knowledge',
    'name': 'General knowledge',
  },
];
final List<String> technologiesUsedInApp = [
  'Tailwind CSS',
  'HTML5',
  'React',
  'Typescript'
];

List<Question> questions = [
  Question(
    question: 'Who is the father of computer?',
    options: generateOptionsForQuestion(
      'Edward Robert',
      'Charles Babbage',
      'Bill Gates',
      'Allen Turning',
    ),
    currectOption: 'b',
    duration: const Duration(seconds: 30),
    category: 'computer',
  ),
  Question(
    question: "The term 'Computer' is derived from.....?",
    options: generateOptionsForQuestion(
      'Greek',
      'China',
      'USA',
      'Latin',
    ),
    currectOption: 'd',
    duration: const Duration(minutes: 1),
    category: 'computer',
  ),
  Question(
    question: 'Who is the father of personal computer?',
    options: generateOptionsForQuestion(
      'Bill Gates',
      'Allen Turning',
      'Edward Robert',
      'Charles Babbage',
    ),
    currectOption: 'c',
    duration: const Duration(minutes: 1),
    category: 'computer',
  ),
  Question(
    question: "What does 'OS' mean in Computer?",
    options: generateOptionsForQuestion(
      'Order Of Significance',
      'Out Of Sync',
      'Operation Symentry',
      'Operating System',
    ),
    currectOption: 'd',
    duration: const Duration(seconds: 30),
    category: 'computer',
  ),
  Question(
    question:
        'Which of the following controls the process of interaction between the user and the operating system?',
    options: generateOptionsForQuestion(
      'User Interface',
      'Chip',
      'GPU',
      'CPU',
    ),
    currectOption: 'a',
    duration: const Duration(minutes: 1),
    category: 'computer',
  ),
  Question(
    question: 'You organize files by sorting them in?',
    options: generateOptionsForQuestion(
      'internet',
      'ROM',
      'folders',
      'RAM',
    ),
    currectOption: 'c',
    duration: const Duration(seconds: 30),
    category: 'computer',
  ),
  Question(
    question: 'What does a Hacker do?',
    options: generateOptionsForQuestion(
      'send unesseccery mails',
      "break into other people's computers",
      'repair laptops',
      "read people's mails",
    ),
    currectOption: 'b',
    duration: const Duration(seconds: 30),
    category: 'computer',
  ),
  Question(
    question: 'What are made and repaired by a cobbler?',
    options: generateOptionsForQuestion(
      'Clothes',
      'Skates',
      'Shoes',
      'Chips',
    ),
    currectOption: 'c',
    duration: const Duration(minutes: 1),
    category: 'general_knowledge',
  ),
  Question(
    question: 'How many states make up the United States of America?',
    options: generateOptionsForQuestion(
      '52 states',
      '40 states',
      '50 states',
      '55 states',
    ),
    currectOption: 'c',
    duration: const Duration(minutes: 1),
    category: 'general_knowledge',
  ),
  Question(
    question: 'H2O is the chemical formular for what?',
    options: generateOptionsForQuestion(
      'ink',
      'graphite',
      'paste',
      'water',
    ),
    currectOption: 'd',
    duration: const Duration(minutes: 1),
    category: 'general_knowledge',
  ),
  Question(
    question:
        "Complete the title of the play by Shakespeare - 'The Merchant of....'?",
    options: generateOptionsForQuestion(
      'Peace',
      'Dennis',
      'Venice',
      'Bear Grylls',
    ),
    currectOption: 'c',
    duration: const Duration(minutes: 2),
    category: 'general_knowledge',
  ),
  Question(
    question: 'In which sport may a player score a birdie, eagle or albatross?',
    options: generateOptionsForQuestion(
      'Golf',
      'Football',
      'Netball',
      'Tennis',
    ),
    currectOption: 'a',
    duration: const Duration(minutes: 2),
    category: 'general_knowledge',
  ),
];
