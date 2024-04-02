import 'package:flutter/material.dart';
import 'on_going_services_view.dart';
import 'widgets/custome_home_bar.dart';
import 'widgets/custome_search.dart';
import 'widgets/fetch_services.dart';
import 'widgets/on_going_page_view.dart';
import 'widgets/service_grid_view.dart';

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
            FetchServices(title: 'الخدمات', onPressed: () {}),
            const ServiceGridView(),
            FetchServices(
                title: 'الخدمات الجارية',
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const OnGoingServicesView(),
                  ));
                }),
            const OnGoingPageView(),
          ],
        ),
      ),
    );
  }
}
