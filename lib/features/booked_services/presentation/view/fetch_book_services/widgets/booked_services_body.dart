import 'package:flutter/material.dart';
import 'package:freelancer_app/features/booked_services/data/models/book_service/datum_booked.dart';
import 'package:freelancer_app/features/booked_services/presentation/view/fetch_book_services/widgets/handle_bookservices_list_view.dart';
import '../../../../../../core/widgets/custome_search_arrowback_bar.dart';

class BookedServicesBody extends StatelessWidget {
  const BookedServicesBody({super.key, required this.booked});
  final List<DatumBooked> booked;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8, left: 8, bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const AspectRatio(aspectRatio: 7),
          const CustomeSearchArrowBackBar(),
          const SizedBox(height: 6),
          const Text(
            'الخدمات المحجوزة',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 6),
          HandleBookServiceListView(booked: booked),
        ],
      ),
    );
  }
}
