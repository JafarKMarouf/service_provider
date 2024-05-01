import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:freelancer_app/core/utils/constant.dart';

class CutomeFreelancerImage extends StatelessWidget {
  const CutomeFreelancerImage({
    super.key,
    required this.height,
    required this.image,
  });
  final double height;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(240),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(240),
        child: CachedNetworkImage(
          imageUrl: image,
          placeholder: (context, url) {
            return const Center(
              child: Text(
                'loading freelancer photo ..',
                style: TextStyle(
                  color: kPrimaryColor,
                ),
              ),
            );
          },
          errorWidget: (context, url, error) {
            return const Icon(
              Icons.error,
              color: kPrimaryColor,
            );
          },
        ),
      ),
    );
  }
}
