import 'package:flutter/material.dart';
import 'package:freelancer_app/constant.dart';

class CustomeTextFormField extends StatelessWidget {
  final TextEditingController? customController;
  final String? hintText;
  final TextInputType type;
  final String? title;
  final bool isSuffix;
  final bool? isObscure;
  final IconData? suffixIcon;
  final IconData? prefixIcon;
  final String? Function(String?)? validate;
  final void Function(String)? onChange;
  final String? Function(String?)? onSubmit;
  final VoidCallback? onPressedSuffix;

  const CustomeTextFormField({
    super.key,
    this.validate,
    this.title,
    this.customController,
    this.hintText,
    this.prefixIcon,
    required this.type,
    required this.isSuffix,
    this.suffixIcon,
    this.isObscure,
    this.onPressedSuffix,
    this.onChange,
    this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isObscure ?? false,
      style: TextStyle(color: Colors.grey[800]),
      decoration: InputDecoration(
        label:  Text(
          title ?? '',
          textDirection: TextDirection.rtl,
          style: const TextStyle(
              fontWeight: FontWeight.w600, color: kPrimaryColor),
        ),
        hintText: hintText,

        hintTextDirection: TextDirection.rtl,
        filled: true,
        fillColor: Colors.grey[300],
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(const Color(0xff9E9D9D)),
        prefixIcon: Icon(
          prefixIcon,
          color: const Color(0xff9E9D9D),
        ),
        suffixIcon: (isSuffix)
            ? IconButton(
          onPressed: onPressedSuffix,
          icon: Icon(
            suffixIcon,
            color: Colors.grey[600],
            size: 20,
          ),
        )
            : const Text(''),
        // hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.black,
          fontSize: 16,
        ),
      ),
      cursorColor: kPrimaryColor,
      controller: customController,
      keyboardType: type,
      onChanged: onChange,

      // style: const TextStyle(color: Colors.black),
      onFieldSubmitted: onSubmit,
      validator: validate,
      // validator: (){
      //
      // },
    );
  }
}

OutlineInputBorder buildBorder([color]) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(
      12,
    ),
    borderSide: BorderSide(color: color ?? Colors.white),
  );
}
