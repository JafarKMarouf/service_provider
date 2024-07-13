import 'package:flutter/material.dart';
import 'package:freelancer_app/core/constants/app_colors.dart';
import 'package:freelancer_app/core/constants/app_images.dart';
import 'package:freelancer_app/core/utils/constant.dart';

class CustomeSearch extends StatelessWidget {
  final double width;
  final String? hintText;
  const CustomeSearch({super.key, required this.width, this.hintText});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: 50,
      child: TextField(
        cursorColor: kPrimaryColor,
        readOnly: true,
        textDirection: TextDirection.rtl,
        style: TextStyle(color: Colors.grey[800]),
        decoration: InputDecoration(
          prefixIcon: Image.asset(AppImages.filters),
          suffixIcon: Image.asset(AppImages.search, color: AppColors.primary),
          hintTextDirection: TextDirection.rtl,
          hintText: hintText ?? 'ابحث عن خدمة',
          contentPadding: const EdgeInsets.only(top: 8),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(18)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: Colors.white)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: Colors.white)),
          filled: true,
          fillColor: Colors.grey[200],
        ),
      ),
    );
  }
}
