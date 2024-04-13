import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freelancer_app/constant.dart';
import 'package:freelancer_app/core/widgets/custome_button.dart';
import 'package:freelancer_app/features/booked_services/presentation/view/confirmed_booked_view.dart';
import 'package:freelancer_app/features/booked_services/presentation/view/widgets/confirmed_booked.dart';
import 'package:freelancer_app/features/home/presentation/view/widgets/custome_search.dart';
import 'package:freelancer_app/features/home/presentation/view/widgets/custome_service_app_bar.dart';
import 'package:get/get.dart' as g;

class BookingConfirmationBody extends StatelessWidget {
  const BookingConfirmationBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 50,
        horizontal: 15,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const CustomeServiceAppBar(
              title: "تأكيد الحجز",
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * .25,
                  child: SvgPicture.asset(
                    'assets/images/img_button_google.svg',
                    height: 100,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .65,
                  child: const ConfirmedBooked(),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            TextField(
              cursorColor: kPrimaryColor,
              textDirection: TextDirection.rtl,
              style: TextStyle(
                color: Colors.grey[800],
              ),
              decoration: InputDecoration(
                suffixIcon: const Icon(
                  Icons.edit,
                  color: kPrimaryColor,
                ),
                hintTextDirection: TextDirection.rtl,
                hintText: 'إضافة ملاحظات',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(color: Colors.white),
                ),
                filled: true,
                fillColor: Colors.grey[100],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 4,
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
