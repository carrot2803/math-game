import 'dart:math';
import 'package:flutter/material.dart';

Color buttonColor = const Color.fromARGB(255, 79, 162, 230);
int num1 = 1, num2 = 1;
String userAnswer = '';
var randomNumber = Random();

var whiteText = const TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 28,
  color: Colors.white,
);

List<String> numPad = [
  '7',
  '8',
  '9',
  'C',
  '4',
  '5',
  '6',
  'DEL',
  '1',
  '2',
  '3',
  '=',
  '0',
];
