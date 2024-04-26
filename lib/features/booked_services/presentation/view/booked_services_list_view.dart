import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelancer_app/features/booked_services/data/models/book_service/datum_booked.dart';
import 'package:freelancer_app/features/booked_services/presentation/view/widgets/booked_services_body.dart';

import '../view_models/book_service_cubit/book_service_cubit.dart';

class BookedServicesListView extends StatefulWidget {
  const BookedServicesListView({
    super.key,
  });

  @override
  State<BookedServicesListView> createState() => _BookedServicesListViewState();
}

class _BookedServicesListViewState extends State<BookedServicesListView> {
  bool loading = true;
  List<DatumBooked> booked = [];

  @override
  void initState() {
    BlocProvider.of<BookServiceCubit>(context).fetchBookServices();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: BlocConsumer<BookServiceCubit, BookServiceState>(
      //     listener: (context, state) {
      //   if (state is BookServiceFailure) {
      //     loading = false;
      //     ScaffoldMessenger.of(context).showSnackBar(
      //       SnackBar(
      //         content: Text(state.errMessage),
      //       ),
      //     );
      //   } else if (state is BookServiceSuccess) {
      //     loading = false;
      //     booked.addAll(state.bookService.data!.toList());
      //   }
      // }, builder: (context, state) {
      //   return BookedServicesBody(booked: booked);
      // }),

      body: BookedServicesBody(booked: booked),
    );
  }
}
