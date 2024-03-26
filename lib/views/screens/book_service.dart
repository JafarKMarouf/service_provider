import 'package:flutter/material.dart';
import 'package:freelancer_app/views/widgets/book_service_body.dart';

class BookService extends StatelessWidget {
  const BookService({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BookServiceBody(),
    );
  }
}

