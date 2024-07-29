import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelancer_app/core/functions/handle_location_permission.dart';
import 'package:geolocator/geolocator.dart';

import 'pick_book_service_infos_state.dart';

class PickBookServiceInfosCubit extends Cubit<PickBookServiceInfosState> {
  TimeOfDay? newTime;
  TimeOfDay selectedTime = TimeOfDay.now();

  DateTime? newDate;
  DateTime selectedDate = DateTime.now();

  String? currentAddress;
  Position? currentPosition;

  PickBookServiceInfosCubit() : super(PickBookServiceInfosInitial());
  Future<void> pickDate(BuildContext context) async {
    newDate = await showDatePicker(
      context: context,
      firstDate: selectedDate,
      lastDate: DateTime(2124),
    );
    newDate == null ? emit(PickDateFailure()) : emit(PickDateUpdated());
  }

  Future<void> pickTime(BuildContext context) async {
    newTime = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    newTime == null ? emit(PickTimeFailure()) : emit(PickTimeUpdated());
  }

  Future<void> pickLocation() async {
    emit(PickLocationLoading());
    currentPosition = await LocationHandler.getCurrentPosition();
    currentPosition == null
        ? emit(PickLocationFailure())
        : emit(PickLocationUpdated());

    // currentAddress =
    //     await LocationHandler.getAddressFromLatLng(currentPosition!);

    // currentAddress == null
    //     ? emit(PickLocationFailure())
    //     : emit(PickLocationUpdated());
  }
}
