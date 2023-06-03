import 'package:flutter/material.dart';
import 'package:math/structs/numpad.dart';
import 'package:math/structs/results.dart';
import 'package:math/structs/var.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void tap(String button) {
    setState(() {
      if (button == '=') {
        checkResult();
      } else if (button == 'C') {
        userAnswer = '';
      } else if (button == 'DEL') {
        if (userAnswer.isNotEmpty) {
          userAnswer = userAnswer.substring(0, userAnswer.length - 1);
        }
      } else if (userAnswer.length < 3) {
        userAnswer += button;
      }
    });
  }

  void checkResult() {
    showDialog(
        context: context,
        builder: (context) {
          return ResultMessage(
            message: (num1 + num2 == int.parse(userAnswer))
                ? 'Correct!'
                : 'Sorry, try again',
            onTap: (num1 + num2 == int.parse(userAnswer))
                ? goToNextQuestion
                : goBackToQuestion,
            icon: (num1 + num2 == int.parse(userAnswer))
                ? Icons.arrow_forward
                : Icons.rotate_left,
          );
        });
  }

  void goToNextQuestion() {
    Navigator.of(context).pop();
    setState(() => userAnswer = '');
    num1 = randomNumber.nextInt(500);
    num2 = randomNumber.nextInt(499);
  }

  void goBackToQuestion() => Navigator.of(context).pop();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[300],
      body: Column(
        children: [
          Container(height: 160, color: Colors.blue),
          Expanded(
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('$num1 + $num2 = ', style: whiteText),
                  Container(
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.blue[400],
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Center(child: Text(userAnswer, style: whiteText)),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: GridView.builder(
                itemCount: numPad.length,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                ),
                itemBuilder: (context, i) {
                  return Button(child: numPad[i], tap: () => tap(numPad[i]));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
