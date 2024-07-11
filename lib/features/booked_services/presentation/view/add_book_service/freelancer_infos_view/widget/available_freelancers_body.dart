import 'package:flutter/material.dart';
import 'package:freelancer_app/core/utils/constant.dart';
import 'package:freelancer_app/core/widgets/custome_infos_service_items.dart';
import 'package:freelancer_app/core/widgets/custome_search_arrowback_bar.dart';
import 'package:freelancer_app/core/widgets/custome_text.dart';
import 'package:freelancer_app/features/booked_services/presentation/view/add_book_service/freelancer_infos_view/freelancer_infos_view.dart';

import 'package:freelancer_app/core/widgets/custome_freelancer_image.dart';
import 'package:get/get.dart' as g;

class AvailableFreelancerBody extends StatelessWidget {
  final String date;
  final String time;
  final String location;

  const AvailableFreelancerBody({
    super.key,
    required this.date,
    required this.time,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15, right: 8, left: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Expanded(child: CustomeSearchArrowBackBar()),
          const Text(
            'الفريلانسر المتاحين',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
          ),
          Expanded(
            child: CustomeInfosServiceItems(
              date: date,
              time: time,
              location: location,
              dateTapped: true,
              timeTapped: true,
              locationTapped: true,
            ),
          ),
          Expanded(
            flex: 3,
            child: GridView.builder(
              scrollDirection: Axis.vertical,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3),
              padding: EdgeInsets.zero,
              itemCount: 10,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Future.delayed(
                      const Duration(microseconds: 250),
                      () {
                        g.Get.to(
                          () => const FreelancerInfosView(),
                          transition: g.Transition.fadeIn,
                          duration: kDurationTransition,
                        );
                      },
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Expanded(
                          child: CustomeFreelancerImage(
                            image:
                                'http://192.168.68.166:8000/storage/experts/1720626012.png',
                            height: 80,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const CustomeText(
                              text: 'هشام',
                              size: 16,
                              weight: FontWeight.w500,
                            ),
                            CustomeText(
                              text: '9000 ل.س',
                              size: 14,
                              weight: FontWeight.w500,
                              color: Colors.grey.shade700,
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(
                                5,
                                (index) => const Icon(
                                  Icons.star,
                                  size: 16,
                                  color: kPrimaryColor,
                                ),
                              ),
                            ),
                            // const SizedBox(height: 5),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
