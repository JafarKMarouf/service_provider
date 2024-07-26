import 'package:flutter/material.dart';
import 'package:freelancer_app/core/utils/constant.dart';
import 'package:freelancer_app/core/widgets/custome_button.dart';
import 'package:freelancer_app/core/widgets/custome_service_bar.dart';
import 'package:freelancer_app/features/booked_services/data/models/book_services/expert.dart'
    as books;
import 'package:freelancer_app/features/booked_services/presentation/view/add_book_service/booking_confirmation/booking_confirmation_view.dart';
import 'package:freelancer_app/features/main/data/models/service_model/expert.dart'
    as service;
import 'package:freelancer_app/core/widgets/custome_freelancer_image.dart';
import 'package:get/get.dart' as g;

class FreelancerInfosBody extends StatelessWidget {
  const FreelancerInfosBody({
    super.key,
    this.freelanceInfos,
    this.expert,
  });
  final books.Expert? freelanceInfos;
  final service.Expert? expert;
  @override
  Widget build(BuildContext context) {
    int rating = 0;
    if (freelanceInfos != null) {
      rating = freelanceInfos!.rating!;
    } else if (expert != null) {
      rating = expert!.rating!;
    } else {
      rating = 0;
    }
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 14.0,
        vertical: 40,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          CustomeServiceBar(
              title: '${freelanceInfos?.user!.name ?? expert?.user!.name}'),
          const SizedBox(height: 16),
          Expanded(
            child: Center(
              child: CustomeFreelancerImage(
                height: 120,
                image: '${freelanceInfos?.photo ?? expert?.photo}',
              ),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'الاسم :   ${freelanceInfos?.user!.name ?? expert?.user!.name}',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: List.generate(
                  rating,
                  (index) {
                    return const Icon(
                      Icons.star,
                      color: kPrimaryColor,
                    );
                  },
                ),
              ),
              Row(
                children: List.generate(
                  5 - rating,
                  (index) {
                    return const Icon(
                      Icons.star_border,
                      color: kPrimaryColor,
                    );
                  },
                ),
              ),
              const Text(
                'التقييم :   ',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                textDirection: TextDirection.rtl,
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            'الوصف :   ${freelanceInfos!.description ?? expert?.description}',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),
          Text(
            'ساعات العمل :   '
            '${freelanceInfos!.workHours} ',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
            textDirection: TextDirection.rtl,
          ),
          // const SizedBox(height: 8),
          // Text(
          //   'الخدمات التي يقدمها :   '
          //   '${freelanceInfos?.expertInfos?.certificate ?? expert?.expertInfos?.certificate}',
          //   style: const TextStyle(
          //     fontSize: 16,
          //     fontWeight: FontWeight.w600,
          //   ),
          //   textDirection: TextDirection.rtl,
          // ),
          const SizedBox(height: 8),
          const Spacer(),
          CustomButton(
            title: 'تفدم',
            width: MediaQuery.of(context).size.width,
            onTap: () {
              Future.delayed(
                const Duration(microseconds: 250),
                () {
                  g.Get.to(
                    () => const BookingConfirmationView(),
                    transition: g.Transition.fadeIn,
                    duration: kDurationTransition,
                  );
                },
              );
            },
          ),
          const SizedBox(height: 14),
        ],
      ),
    );
  }
}
