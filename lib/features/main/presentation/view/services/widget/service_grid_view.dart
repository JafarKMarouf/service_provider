
import 'package:flutter/material.dart';
import 'package:freelancer_app/core/utils/constant.dart';
import 'package:freelancer_app/features/booked_services/presentation/view/add_book_service/service_infos_view/service_infos_view.dart';
import 'package:freelancer_app/features/main/data/models/service_model/service_datum.dart';
import 'package:freelancer_app/features/main/presentation/view/services/widget/service_infos_minimum.dart';
import 'package:get/get.dart' as g;

class ServiceGridView extends StatelessWidget {
  final List<ServiceDatum> data;

  const ServiceGridView({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: data.length < 3 ? 135 : 260,
      child: data.isNotEmpty
          ? GridView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3),
              padding: const EdgeInsets.only(top: 15, bottom: 10),
              itemCount: data.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    g.Get.to(
                      () => ServiceInfosView(data: data[index]),
                      transition: g.Transition.fadeIn,
                      duration: kDurationTransition,
                    );
                  },
                  child: ServiceInfosMinimum(data: data[index]),
                );
              })
          : const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.menu,
                  size: 90,
                  color: kPrimaryColor,
                ),
                Text(
                  'No found any service for this category yet!',
                  style: TextStyle(
                    fontFamily: 'Poppins Medium',
                    fontSize: 30,
                    color: Color.fromARGB(255, 136, 131, 131),
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
    );
  }
}
