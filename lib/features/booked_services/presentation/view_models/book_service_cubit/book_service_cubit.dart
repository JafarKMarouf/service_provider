import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelancer_app/features/booked_services/data/models/book_services/book_services.dart';
import 'package:freelancer_app/features/booked_services/data/repos/book_service_repo_impl.dart';
import 'package:geolocator/geolocator.dart';

part 'book_service_state.dart';

class BookServiceCubit extends Cubit<BookServiceState> {
  TimeOfDay? newTime;
  TimeOfDay selectedTime = TimeOfDay.now();

  DateTime? newDate;
  DateTime selectedDate = DateTime.now();

  String? currentAddress;
  Position? currentPosition;

  final BookServiceRepoImpl bookServiceRepoImpl;
  BookServiceCubit(this.bookServiceRepoImpl) : super(BookServiceInitial());

  Future<void> fetchBookServices() async {
    emit(BookServiceLoading());

    var result = await bookServiceRepoImpl.fetchAllBookServices();

    result.fold(
      (fail) => emit(
        BookServiceFailure(errMessage: fail.errMessage),
      ),
      (bookService) => emit(BookServiceSuccess(bookService: bookService)),
    );
  }
}
