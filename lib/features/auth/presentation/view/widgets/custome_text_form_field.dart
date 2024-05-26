import 'package:flutter/material.dart';
import 'package:freelancer_app/core/constants/app_colors.dart';
import 'package:freelancer_app/core/utils/constant.dart';

class CustomeTextFormField extends StatelessWidget {
  final TextEditingController? customController;
  final String? hintText;
  final TextInputType type;
  final String? title;
  final bool isSuffix;
  final bool isObscure;
  final String? prefixText;
  final String? Function(String?)? validate;
  final void Function(String)? onChange;
  final String? Function(String?)? onSubmit;
  final VoidCallback? onPressedSuffix;
  final bool dir;
  final Widget? suffix;
  final Widget? prefix;

  const CustomeTextFormField({
    super.key,
    this.validate,
    this.title,
    this.customController,
    this.hintText,
    this.prefixText,
    required this.type,
    required this.isSuffix,
    this.isObscure = false,
    this.onPressedSuffix,
    this.onChange,
    this.onSubmit,
    this.dir = true,
    this.prefix,
    this.suffix,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(color: AppColors.primary),
      obscureText: isObscure,
      cursorColor: kPrimaryColor,
      controller: customController,
      keyboardType: type,
      onChanged: onChange,
      onFieldSubmitted: onSubmit,
      validator: validate,
      decoration: InputDecoration(
        prefixText: prefixText,
        filled: true,
        fillColor: AppColors.filledForm,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        border: buildBorder(),
        enabledBorder: buildBorder(const Color(0xFFFAFAFA)),
        focusedBorder: buildBorder(kPrimaryColor),
        prefixIcon: prefix,
        suffixIcon: suffix,
        hintTextDirection: dir ? TextDirection.rtl : TextDirection.ltr,
        hintText: hintText,
        hintStyle: const TextStyle(
          color: AppColors.dustyGray,
          fontSize: 14,
        ),
      ),
    );
  }
}

OutlineInputBorder buildBorder([color]) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: BorderSide(
      color: color ?? const Color(0xffFAFAFA),
    ),
  );
}
