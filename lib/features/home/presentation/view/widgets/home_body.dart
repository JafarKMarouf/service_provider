import 'package:flutter/material.dart';
import 'package:freelancer_app/constant.dart';
import 'package:freelancer_app/features/booked_services/presentation/view/booked_services_list_view.dart';
import 'package:get/get.dart';

import 'custome_home_bar.dart';
import 'custome_search.dart';
import 'fetch_services.dart';
import 'on_going_page_view.dart';
import 'service_grid_view.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 16,
        left: 16,
        top: 60,
        bottom: 30,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const CustomeHomeBar(),
            const SizedBox(
              height: 15,
            ),
            CustomeSearch(
              width: MediaQuery.of(context).size.width,
            ),
            const SizedBox(
              height: 15,
            ),
            FetchServices(
              title: 'الخدمات',
              onPressed: () {},
            ),
            const ServiceGridView(),
            FetchServices(
              title: 'الخدمات الجارية',
              onPressed: () {
                Get.to(
                  () => const BookedServicesListView(),
                  transition: Transition.fadeIn,
                  duration: kDurationTransition,
                );
              },
            ),
            const OnGoingPageView(),
          ],
        ),
      ),
    );
  }
}
