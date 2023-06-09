import 'package:flutter/material.dart';
import 'package:math/structs/var.dart';

class ResultMessage extends StatelessWidget {
  final String message;
  final VoidCallback onTap;
  // ignore: prefer_typing_uninitialized_variables
  final icon;

  const ResultMessage({
    super.key,
    required this.message,
    required this.onTap,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.blue,
      content: SizedBox(
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(message, style: whiteText),
            GestureDetector(
              onTap: onTap,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.blue[300],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
