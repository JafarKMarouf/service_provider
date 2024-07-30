import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelancer_app/core/utils/constant.dart';
import 'package:freelancer_app/features/booked_services/presentation/view_models/book_service_cubit/book_service_cubit.dart';

class AddNotesBook extends StatelessWidget {
  const AddNotesBook({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<BookServiceCubit>(context);

    return TextField(
      cursorColor: kPrimaryColor,
      textDirection: TextDirection.rtl,
      style: TextStyle(
        color: Colors.grey[800],
      ),
      controller: cubit.description,
      // onSubmitted: (value) {},
      // onChanged: (value) {
      //   cubit.description!.text = value;
      // },
      keyboardType: TextInputType.text,
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
