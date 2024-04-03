import 'package:flutter/material.dart';

import '../constants/ui_constants.dart';

class TextBodyCardInfo extends StatelessWidget {
  const TextBodyCardInfo({
    super.key,
    required this.text,
    required this.amount,
  });

  final String text, amount;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5.5),
      child: Row(
        children: [
          RichText(
            text: TextSpan(
                text: "$text",
                style: TextStyle(
                    fontSize: 15,
                    color: kTextColor,
                    fontWeight: FontWeight.w400)),
          ),
          Spacer(),
          RichText(
            text: TextSpan(
                text: "$amount",
                style: TextStyle(
                    fontSize: 15,
                    color: kTextColor,
                    fontWeight: FontWeight.bold)),
          )
        ],
      ),
    );
  }
}
