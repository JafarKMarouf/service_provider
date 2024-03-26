import 'package:flutter/material.dart';
import 'package:freelancer_app/views/screens/progress_services.dart';
import 'package:freelancer_app/views/widgets/custome_app_bar.dart';
import 'package:freelancer_app/views/widgets/custome_seach.dart';
import 'package:freelancer_app/views/widgets/progress_service_page_view.dart';
import 'package:freelancer_app/views/widgets/service_grid_view.dart';
import 'package:freelancer_app/views/widgets/type_service.dart';

class ServicesView extends StatelessWidget {
  const ServicesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16, left: 16, top: 60, bottom: 30),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const CustomeAppBar(),
            const SizedBox(
              height: 15,
            ),
            CustomeSearch(width: MediaQuery.of(context).size.width,),
            const SizedBox(
              height: 15,
            ),
            TypeServices(title: 'الخدمات', onPressed: () {}),
            const ServiceGridView(),
            TypeServices(
                title: 'الخدمات الجارية',
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ProgressServices(),));
                }),
            const ProgressServicePageView(),
          ],
        ),
      ),
    );
  }
}
