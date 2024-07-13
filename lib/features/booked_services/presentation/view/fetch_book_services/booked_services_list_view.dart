import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelancer_app/core/widgets/custome_search_arrowback_bar.dart';
import 'package:freelancer_app/features/booked_services/data/models/book_service/datum_booked.dart';
import 'package:freelancer_app/features/booked_services/presentation/view_models/book_service_cubit/book_service_cubit.dart';

import 'widgets/handle_bookservices_list_view.dart';

class BookedServicesListView extends StatelessWidget {
  const BookedServicesListView({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<BookServiceCubit>(context).fetchBookServices();
    List<DatumBooked> booked = [];

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(right: 8, left: 8, bottom: 15),
        height: MediaQuery.sizeOf(context).height,
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
      ),
    );
  }
}
