import 'package:flutter/material.dart';
import 'package:freelancer_app/core/utils/constant.dart';
import 'package:freelancer_app/core/widgets/custome_search.dart';
import 'package:freelancer_app/features/booked_services/presentation/view/fetch_book_services/booked_services_list_view.dart';
import 'package:freelancer_app/features/main/presentation/view/fetch_services/widget/services_list_view.dart';
import 'package:freelancer_app/features/main/presentation/view/home/widget/handle_bookservice_ui.dart';
import 'package:freelancer_app/features/main/presentation/view/home/widget/handle_services_ui.dart';
import 'package:freelancer_app/features/main/presentation/view/home/widget/handle_user_details.dart';
import 'package:get/get.dart' as g;
import '../../../../../../core/widgets/fetch_services.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    bool loading = true;

    return Padding(
      padding: const EdgeInsets.only(right: 8, left: 8, bottom: 15, top: 8),
      child: ListView(
        children: [
          const Expanded(flex: 1, child: SizedBox()),

          const HandleUserDetails(),
          const SizedBox(height: 6),

          CustomeSearch(
            width: MediaQuery.of(context).size.width,
          ),
          const SizedBox(height: 3),

          //============================ الخدمات المتاحة=====================
          FetchServices(
            title: 'الخدمات المتاحة',
            onPressed: () {
              g.Get.to(
                () => ServicesListView(loading: !loading),
                transition: g.Transition.fadeIn,
                duration: kDurationTransition,
              );
            },
          ),
          const HandleServicesUi(),

          //============================  الخدمات المحجوزة=====================
          FetchServices(
            title: 'الخدمات المحجوزة',
            onPressed: () {
              g.Get.to(
                () => const BookedServicesListView(),
                transition: g.Transition.fadeIn,
                duration: kDurationTransition,
              );
            },
          ),
          const HandleBookServiceUi(),
        ],
      ),
    );
  }
}
