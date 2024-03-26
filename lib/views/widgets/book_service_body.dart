import 'package:flutter/material.dart';
import 'package:freelancer_app/views/widgets/book_service_app_bar.dart';

class BookServiceBody extends StatelessWidget {
  const BookServiceBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding:EdgeInsets.symmetric(vertical: 60.0,horizontal: 15),
      child: Column(
        children: [
          BookServiceAppBar(),

        ],
      ),
    );
  }
}
