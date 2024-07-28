import 'package:flutter/material.dart';
import 'package:freelancer_app/core/utils/constant.dart';
import 'package:freelancer_app/core/widgets/custome_button.dart';
import 'package:freelancer_app/features/booked_services/data/models/book_services/book_datum.dart';
import 'package:freelancer_app/features/booked_services/presentation/view/add_book_service/booking_confirmation/widget/add_notes_for_book.dart';
import 'package:freelancer_app/features/booked_services/presentation/view/confirmed_booked_view.dart';
import 'package:freelancer_app/features/booked_services/presentation/view/widgets/confirmed_booked.dart';
import 'package:freelancer_app/core/widgets/custome_service_bar.dart';

import 'package:get/get.dart' as g;

class BookingConfirmationView extends StatelessWidget {
  final DatumBooked? booked;
  const BookingConfirmationView({super.key, required this.booked});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const CustomeServiceBar(title: "تأكيد الحجز"),
              const SizedBox(height: 50),
              Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .25,
                    // child: SvgPicture.asset(
                    //   'assets/images/img_button_google.svg',
                    //   height: 100,
                    // ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .65,
                    child: ConfirmedBooked(
                      booked: booked!,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const AddNotesBook(),
              SizedBox(height: MediaQuery.of(context).size.height / 4),
              CustomButton(
                title: 'تأكيد الحجز',
                onTap: () {
                  Future.delayed(
                    const Duration(microseconds: 250),
                    () {
                      g.Get.to(
                        () => const ConfirmedBookedView(),
                        transition: g.Transition.fadeIn,
                        duration: kDurationTransition,
                      );
                    },
                  );
                },
                width: MediaQuery.of(context).size.width,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
