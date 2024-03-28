import 'package:flutter/material.dart';

class TextThanks extends StatelessWidget {
  const TextThanks({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: Colors.blueGrey,
      ),
    );
  }
}
