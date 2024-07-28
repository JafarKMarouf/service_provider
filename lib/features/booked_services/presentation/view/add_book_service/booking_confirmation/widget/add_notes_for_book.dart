import 'package:flutter/material.dart';
import 'package:freelancer_app/core/utils/constant.dart';

class AddNotesBook extends StatelessWidget {
  const AddNotesBook({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: kPrimaryColor,
      textDirection: TextDirection.rtl,
      style: TextStyle(
        color: Colors.grey[800],
      ),
      decoration: InputDecoration(
        suffixIcon: const Icon(
          Icons.edit,
          color: kPrimaryColor,
        ),
        hintTextDirection: TextDirection.rtl,
        hintText: 'إضافة ملاحظات',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Colors.white),
        ),
        filled: true,
        fillColor: Colors.grey[100],
      ),
    );
  }
}
