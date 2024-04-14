import 'package:flutter/material.dart';

class DisplayLocation extends StatelessWidget {
  const DisplayLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.grey[200]
      ),
      // child: Card(),
    );
  }
}
