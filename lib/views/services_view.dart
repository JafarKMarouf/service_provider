import 'package:flutter/material.dart';
import 'package:freelancer_app/constant.dart';
import 'package:freelancer_app/views/widgets/custome_app_bar.dart';
import 'package:freelancer_app/views/widgets/custome_seach.dart';
import 'package:freelancer_app/views/widgets/progress_service_page_view.dart';
import 'package:freelancer_app/views/widgets/service_grid_view.dart';

class ServicesView extends StatelessWidget {
  const ServicesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(right: 16,left: 16,top: 60,bottom: 30),
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomeAppBar(),
            SizedBox(
              height: 15,
            ),
            CustomeSearch(),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'رؤية الكل',
                  style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  'الخدمات',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
                ),
              ],
            ),
            ServiceGridView(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'رؤية الكل',
                  style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  'الخدمات الجارية',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
                ),
              ],
            ),
            ProgressServicePageView(),
          ],
        ),
      ),
    );
  }
}
