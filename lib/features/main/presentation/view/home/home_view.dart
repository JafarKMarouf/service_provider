import 'package:flutter/material.dart';
import 'package:freelancer_app/core/utils/constant.dart';
import 'package:freelancer_app/core/widgets/custome_search.dart';
import 'package:freelancer_app/features/booked_services/presentation/view/fetch_book_services/booked_services_list_view.dart';
import 'package:freelancer_app/features/main/presentation/view/categories/categories_list_view.dart';
import 'package:freelancer_app/features/main/presentation/view/home/widget/handle_bookservice_ui.dart';
import 'package:freelancer_app/features/main/presentation/view/home/widget/handle_categories_ui.dart';
import 'package:freelancer_app/features/main/presentation/view/home/widget/handle_user_details.dart';
import 'package:get/get.dart' as g;
import '../../../../../../core/widgets/fetch_services.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    bool loading = true;

    return Container(
      padding: const EdgeInsets.only(right: 8, left: 8, bottom: 15, top: 8),
      height: MediaQuery.sizeOf(context).height,
      child: Column(
        children: [
          const Expanded(flex: 2, child: HandleUserDetails()),
          CustomeSearch(width: MediaQuery.of(context).size.width),

          //============================ فئات الخدمات المتاحة ====================
          FetchServices(
            title: 'الخدمات',
            onPressed: () => g.Get.to(
              () => CategoriesListView(loading: !loading),
              transition: g.Transition.fadeIn,
              duration: kDurationTransition,
            ),
          ),
          const HandleCategoriesUi(),

          //============================  الخدمات المحجوزة========================

          FetchServices(
            title: 'الخدمات المحجوزة',
            onPressed: () => g.Get.to(
              () => const BookedServicesListView(),
              transition: g.Transition.fadeIn,
              duration: kDurationTransition,
            ),
          ),
          const HandleBookServiceUi(),
        ],
      ),
    );
  }
}
