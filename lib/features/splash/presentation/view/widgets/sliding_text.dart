import 'package:flutter/material.dart';

class SlidingText extends StatelessWidget {
  const SlidingText({
    super.key,
    required this.slidingAnimation,
  });

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: slidingAnimation,
      builder: (context,_) =>  SlideTransition(
        position: slidingAnimation,
        child: const Text(
          'Service Provider',
          style: TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 34,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
