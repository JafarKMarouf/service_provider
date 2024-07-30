import 'dart:developer';

import 'package:equatable/equatable.dart';
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
  String? newTime;
  String? newDate;
  Position? currentPosition;

  final BookServiceRepoImpl bookServiceRepoImpl;
  BookServiceCubit(this.bookServiceRepoImpl) : super(BookServiceInitial());

  Future<void> fetchBookServices() async {
    emit(BookServiceLoading());

    var result = await bookServiceRepoImpl.fetchAllBookServices();

    result.fold(
        (fail) => emit(
              BookServiceFailure(errMessage: fail.errMessage),
            ), (bookService) {
      log('$bookService');
      emit(BookServiceSuccess(bookService: bookService));
    });
  }

  Future<void> addBookedServices({
    required int customerId,
    required int expertId,
    required int serviceId,
    required String deliveryTime,
    required String deliveryDate,
    String? description,
  }) async {
    emit(BookServiceLoading());

    var result = await bookServiceRepoImpl.addBookService(
      customerId: customerId,
      expertId: expertId,
      serviceId: serviceId,
      deliveryTime: deliveryTime,
      deliveryDate: deliveryDate,
      description: description,
    );

    result.fold((fail) {
      log('=====fail:$fail========');
      emit(BookServiceFailure(errMessage: fail.errMessage));
    }, (booked) {
      log('=========success:$booked=============');
      emit(BookServiceAddSuccess(bookService: booked));
      // emit(BookServiceSuccess(booked: booked));
    });
  }
}
