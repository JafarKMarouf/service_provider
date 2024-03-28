import 'package:flutter/material.dart';
import 'package:freelancer_app/views/screens/on_going_services_view.dart';
import 'package:freelancer_app/views/widgets/custome_home_bar.dart';
import 'package:freelancer_app/views/widgets/custome_search.dart';
import 'package:freelancer_app/views/widgets/on_going_service_page_view.dart';
import 'package:freelancer_app/views/widgets/service_grid_view.dart';
import 'package:freelancer_app/views/widgets/show_all_service.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16, left: 16, top: 60, bottom: 30),
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
            ShowAllServices(title: 'الخدمات', onPressed: () {}),
            const ServiceGridView(),
            ShowAllServices(
                title: 'الخدمات الجارية',
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const OnGoingServicesView(),
                  ));
                }),
            const OnGoingServicePageView(),
          ],
        ),
      ),
    );
  }
}
