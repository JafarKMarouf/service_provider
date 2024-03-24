import 'package:flutter/material.dart';
import 'package:freelancer_app/constant.dart';

class CustomeSearch extends StatelessWidget {
  const CustomeSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: kPrimaryColor,
      textDirection: TextDirection.rtl,
      style: TextStyle(color: Colors.grey[800]),
      decoration: InputDecoration(
        suffixIcon: Icon(Icons.search, size: 32, color: Colors.grey[500]),
        prefixIcon:
            Icon(Icons.filter_list_rounded, color: Colors.grey[500], size: 32),
        hintTextDirection: TextDirection.rtl,
        hintText: 'ابحث عن خدمة',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: Colors.white)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: Colors.white)),
        filled: true,
        fillColor: Colors.grey[200],
      ),
    );
  }
}
