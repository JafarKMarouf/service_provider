import 'package:flutter/material.dart';
import 'package:freelancer_app/features/bookmark/presentation/view/widget/bookmark_services_body.dart';

class BookmarkServicesView extends StatelessWidget {
  
  const BookmarkServicesView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BookmarkServicesBody(),
    );
  }
}