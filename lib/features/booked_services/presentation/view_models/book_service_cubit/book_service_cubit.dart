import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelancer_app/features/booked_services/data/models/book_services/book_datum.dart';
import 'package:freelancer_app/features/booked_services/data/models/book_services/book_services.dart';
import 'package:freelancer_app/features/booked_services/data/repos/book_service_repo_impl.dart';
import 'package:geolocator/geolocator.dart';

part 'book_service_state.dart';

class BookServiceCubit extends Cubit<BookServiceState> {
  int? serviceId;
  String? serviceName;
  String? photo;
  int? customerId;
  int? expertId;
  String? expertName;
  double? price;
  String? mobile;
  int? rating;
  String? deliveryTime;
  String? deliveryDate;
  Position? currentPosition;
  TextEditingController? description;

  final BookServiceRepoImpl bookServiceRepoImpl;
  BookServiceCubit(this.bookServiceRepoImpl) : super(BookServiceInitial());

  Future<void> fetchBookServices() async {
    emit(BookServiceLoading());

    var result = await bookServiceRepoImpl.fetchAllBookServices();

    result.fold(
      (fail) {
        emit(BookServiceFailure(errMessage: fail.errMessage));
      },
      (bookService) {
        emit(BookServiceSuccess(bookService: bookService));
      },
    );
  }

  Future<void> addBookedServices({
    required int expertId,
    required int serviceId,
    required String deliveryTime,
    required String deliveryDate,
    required String location,
    String? description,
  }) async {
    emit(BookServiceLoading());

    var result = await bookServiceRepoImpl.addBookService(
      expertId: expertId,
      serviceId: serviceId,
      deliveryTime: deliveryTime,
      deliveryDate: deliveryDate,
      location: location,
      description: description,
    );

    result.fold(
      (fail) {
        emit(BookServiceFailure(errMessage: fail.errMessage));
      },
      (booked) {
        emit(BookServiceAddSuccess(bookService: booked));
      },
    );
  }
}
