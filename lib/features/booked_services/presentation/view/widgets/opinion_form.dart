import 'package:flutter/material.dart';
import 'package:freelancer_app/core/utils/constant.dart';

class OpinionForm extends StatelessWidget {
  const OpinionForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: SizedBox(
        height: 50,
        child: TextFormField(
          cursorColor: kPrimaryColor,
          textDirection: TextDirection.rtl,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Colors.white),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Colors.white),
              ),
              filled: true,
              fillColor: Colors.grey[200],
              suffixIcon: const Icon(
                Icons.edit,
                color: kPrimaryColor,
              ),
              hintTextDirection: TextDirection.rtl,
              hintText: "أضف ملاحظات إن وجدت",
              hintStyle:
                  const TextStyle(color: Color(0xff9E9D9D), fontSize: 14)),
        ),
      ),
    );
  }
}
