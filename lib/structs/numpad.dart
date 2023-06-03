import 'package:flutter/material.dart';
import 'var.dart';

class Button extends StatelessWidget {
  final String child;
  final VoidCallback tap;

  const Button({super.key, required this.child, required this.tap});

  @override
  Widget build(BuildContext context) {
    var btnColor = Colors.blue[400];
    if (child == 'C') {
      btnColor = Colors.green;
    } else if (child == 'DEL') {
      btnColor = Colors.red;
    } else if (child == '=') {
      btnColor = Colors.blue;
    }

    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: GestureDetector(
        onTap: tap,
        child: Container(
          decoration: BoxDecoration(
            color: btnColor,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Center(child: Text(child, style: whiteText)),
        ),
      ),
    );
  }
}
