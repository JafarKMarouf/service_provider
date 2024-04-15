import 'package:flutter/material.dart';

class CutomeFreelancerImage extends StatelessWidget {
  const CutomeFreelancerImage({
    super.key,
    required this.height,
  });
  final double height;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(
        240,
      ),
      child: Image(
        height: height,
        image: const AssetImage(
          'assets/images/profile.png',
        ),
      ),
    );
  }
}
