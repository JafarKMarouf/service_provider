import 'package:flutter/material.dart';

class DisplayLocation extends StatelessWidget {
  const DisplayLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.grey[100],
        ),
        // child: Card(),
      ),
    );
  }
}
