import 'package:flutter/material.dart';
import 'package:freelancer_app/core/utils/constant.dart';

class RatingFreelancer extends StatelessWidget {
  final int rating;
  final double size;
  const RatingFreelancer({
    super.key,
    required this.rating,
    this.size = 20,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: List.generate(
            rating,
            (index) {
              return Icon(
                Icons.star,
                size: size,
                color: const Color.fromARGB(255, 255, 232, 23),
              );
            },
          ),
        ),
        Row(
          children: List.generate(
            5 - rating,
            (index) {
              return Icon(
                Icons.star_border,
                size: size,
                color: kPrimaryColor,
              );
            },
          ),
        ),
      ],
    );
  }
}
