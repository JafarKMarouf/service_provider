import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:freelancer_app/core/utils/constant.dart';
import 'package:shimmer/shimmer.dart';

class CustomeFreelancerImage extends StatelessWidget {
  const CustomeFreelancerImage({
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
        borderRadius: BorderRadius.circular(200),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(240),
        child: CachedNetworkImage(
          imageUrl: image,
          placeholder: (context, url) {
            return Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: const CircleAvatar(
                radius: 90,
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
