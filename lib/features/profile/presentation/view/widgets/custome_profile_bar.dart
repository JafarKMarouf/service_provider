import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freelancer_app/core/constants/app_images.dart';
import 'package:freelancer_app/core/utils/constant.dart';
import 'package:shimmer/shimmer.dart';

class CustomeProfileBar extends StatelessWidget {
  const CustomeProfileBar({
    super.key,
    this.title,
    this.onPressed,
    this.isLoading = false,
  });

  final String? title;
  final void Function()? onPressed;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(AppImages.bookmarksvg, height: 24, width: 24),
            SvgPicture.asset(AppImages.savesvg, height: 24, width: 24),
          ],
        ),
        !isLoading
            ? Text(
                title!,
                style: const TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 16,
                ),
                textDirection: TextDirection.rtl,
              )
            : Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  width: 80,
                  height: 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: Colors.white,
                  ),
                ),
              ),
        IconButton(
          onPressed: onPressed,
          icon: const Icon(
            Icons.exit_to_app,
            color: kPrimaryColor,
            size: 32,
          ),
        )
      ],
    );
  }
}
