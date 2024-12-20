import 'package:flutter/material.dart';
import '../utilities/constants.dart';

class CardContentWidget extends StatelessWidget {
  final String text;
  final IconData icon;
  const CardContentWidget({super.key, required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          text,
          style: KCardTextStyle,
        )
      ],
    );
  }
}