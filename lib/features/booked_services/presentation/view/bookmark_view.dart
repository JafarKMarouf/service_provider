import 'package:flutter/material.dart';
import 'package:freelancer_app/features/booked_services/presentation/view/widgets/bookmark_services_body.dart';

class BookmarkServicesView extends StatefulWidget {
  const BookmarkServicesView({
    super.key,
  });

  @override
  State<BookmarkServicesView> createState() => _BookmarkServicesViewState();
}

class _BookmarkServicesViewState extends State<BookmarkServicesView> {
  bool loading = true;
  // List<DatumBooked> booked = [];

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BookmarkServicesBody(),
    );
  }
}
