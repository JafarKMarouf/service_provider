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
  final String? prefixText;
  final String? Function(String?)? validate;
  final void Function(String)? onChange;
  final String? Function(String?)? onSubmit;
  final VoidCallback? onPressedSuffix;
  final bool dir;

  const CustomeTextFormField({
    super.key,
    this.validate,
    this.title,
    this.customController,
    this.hintText,
    this.prefixIcon,
    this.prefixText,
    required this.type,
    required this.isSuffix,
    this.suffixIcon,
    this.isObscure,
    this.onPressedSuffix,
    this.onChange,
    this.onSubmit,
    this.dir = true,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isObscure ?? false,
      style: TextStyle(color: Colors.grey[800]),
      decoration: InputDecoration(
        prefixText: prefixText,
        hintText: hintText,
        hintTextDirection: dir ? TextDirection.rtl : TextDirection.ltr,
        filled: true,
        fillColor: Colors.grey[200],
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        border: buildBorder(),
        enabledBorder: buildBorder(Colors.blueGrey[200]),
        focusedBorder: buildBorder(kPrimaryColor),
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
            : null,
        hintStyle: const TextStyle(
          // color: Colors.black,
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
