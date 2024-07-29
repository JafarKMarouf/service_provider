import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:freelancer_app/core/utils/constant.dart';
import 'package:freelancer_app/core/widgets/custome_button.dart';
import 'package:freelancer_app/features/booked_services/data/models/book_services/book_datum.dart';
import 'package:freelancer_app/features/booked_services/presentation/view/confirmed_booked_view.dart';
import 'package:freelancer_app/features/booked_services/presentation/view/widgets/confirmed_booked.dart';
import 'package:freelancer_app/core/widgets/custome_service_bar.dart';

import 'package:get/get.dart' as g;
import 'package:shimmer/shimmer.dart';

class BookingConfirmationView extends StatelessWidget {
  final DatumBooked? booked;
  const BookingConfirmationView({super.key, required this.booked});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: Column(
          children: [
            const Expanded(child: CustomeServiceBar(title: "تأكيد الحجز")),
            const Expanded(child: SizedBox()),
            Expanded(
              flex: 7,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * .25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: kPrimaryColor,
                    ),
                    child: CachedNetworkImage(
                      imageUrl: '${booked!.service!.photo}',
                      placeholder: (context, url) => Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                          ),
                        ),
                      ),
                      errorWidget: (context, url, error) => const Icon(
                        Icons.error,
                        color: Colors.white,
                        size: 45,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .65,
                    child: ConfirmedBooked(booked: booked!),
                  ),
                ],
              ),
            ),
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
    );
  }
}
