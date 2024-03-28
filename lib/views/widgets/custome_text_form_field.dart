import 'package:flutter/material.dart';
import 'package:freelancer_app/constant.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController customController;
  // final String hintText;
  final TextInputType type;
  final String title;
  final bool isSuffix;
  final bool? isObsecure;
  final IconData? suffixIcon;
  final IconData? prefixIcon;
  final String? Function(String?)? validate;
  final void Function(String)? onChange;
  final String? Function(String?)? onSubmit;
  final VoidCallback? onPressedSuffix;
  const CustomTextFormField({
    super.key,
    required this.validate,
    required this.title,
    required this.customController,
    // required this.hintText,
    this.prefixIcon,
    required this.type,
    required this.isSuffix,
    this.suffixIcon,
    this.isObsecure,
    this.onPressedSuffix,
    this.onChange,
    this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isObsecure ?? false,
      style: TextStyle(color: Colors.grey[800]),
      decoration: InputDecoration(
        label: Text(
          title,
          textDirection: TextDirection.rtl,
          style: const TextStyle(
              fontWeight: FontWeight.w600, color: kPrimaryColor),
        ),
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
        hintStyle: TextStyle(
          color: Colors.grey[600],
          fontSize: 16,
        ),
      ),
      cursorColor: const Color(0xff36789D),
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
