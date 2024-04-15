import 'package:flutter/material.dart';

class CustomeText extends StatelessWidget {
  const CustomeText({
    super.key,
    required this.text,
    required this.size,
    required this.weight,
    this.color = Colors.black,
  });
  final String text;
  final double size;
  final FontWeight weight;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        fontWeight: weight,
        color: color,
      ),
      overflow: TextOverflow.fade,
      // overflow: TextOverflow.ellipsis,
      // maxLines: 3,
      textDirection: TextDirection.rtl,
    );
  }
}
