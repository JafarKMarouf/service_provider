import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelancer_app/core/utils/api_service.dart';
import 'package:freelancer_app/core/widgets/custome_search_arrowback_bar.dart';
import 'package:freelancer_app/features/booked_services/data/models/book_services/book_datum.dart';
import 'package:freelancer_app/features/booked_services/data/repos/book_service_repo_impl.dart';
import 'package:freelancer_app/features/booked_services/presentation/view/fetch_book_services/widgets/handle_bookservices_list_view.dart';
import 'package:freelancer_app/features/booked_services/presentation/view_models/book_service_cubit/book_service_cubit.dart';

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
    // return BlocProvider(
    //   create: (context) => BookServiceCubit(
    //     BookServiceRepoImpl(apiService: ApiService(Dio())),
    //   ),
    //   child: const BookedServicesBody(),
    // );
  }
}

class BookedServicesBody extends StatelessWidget {
  const BookedServicesBody({super.key});

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
