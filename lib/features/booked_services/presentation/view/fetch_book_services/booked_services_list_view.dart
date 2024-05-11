import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelancer_app/features/booked_services/data/models/book_service/datum_booked.dart';
import 'package:freelancer_app/features/booked_services/presentation/view/fetch_book_services/widgets/booked_services_body.dart';
import 'package:freelancer_app/features/booked_services/presentation/view_models/book_service_cubit/book_service_cubit.dart';

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
      body: BookedServicesBody(booked: booked),
    );
  }
}
