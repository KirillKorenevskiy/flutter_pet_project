import 'package:flutter/material.dart';

class NumberOfCoins extends StatelessWidget {
  const NumberOfCoins({
    super.key,
    required this.number,
    required this.backgroundColor,
    required this.textColor,
  });

  final int number;
  final Color backgroundColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 20, top: 10),
      width: 80,
      height: 65,
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(
          color: Colors.white,
          width: 2,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      child: Center(
        child: Text(
          "$number",
          style: TextStyle(color: textColor),
        ),
      ),
    );
  }
}
