import 'package:flutter/material.dart';
import 'package:freelancer_app/core/utils/constant.dart';
import 'package:freelancer_app/core/widgets/custome_button.dart';
import 'package:freelancer_app/core/widgets/custome_infos_service_items.dart';
import 'package:freelancer_app/core/widgets/custome_service_bar.dart';
import 'package:freelancer_app/core/widgets/display_location.dart';
import 'package:freelancer_app/features/main/data/models/service_model/datum_service.dart';
import 'package:get/get.dart' as g;
import 'package:intl/intl.dart' as intl;

import '../../freelancer_infos_view/available_freelancer_view.dart';
import 'service_type.dart';

class ServiceInfosBody extends StatefulWidget {
  const ServiceInfosBody({super.key, required this.data});
  final DatumService data;

  @override
  State<ServiceInfosBody> createState() => ServiceInfosBodyState();
}

class ServiceInfosBodyState extends State<ServiceInfosBody> {
  DateTime? newDate;
  TimeOfDay? newTime;
  var formatDate = '';
  var formatTime = '';

  @override
  Widget build(BuildContext context) {
    TimeOfDay selectedTime = TimeOfDay.now();
    DateTime selectedDate = DateTime.now();

    return Padding(
      padding: const EdgeInsets.only(right: 8, left: 8, bottom: 15),
      child: Column(
        children: [
          const Expanded(child: CustomeServiceBar(title: "وصف الخدمة")),
          ServiceType(data: widget.data),
          CustomeInfosServiceItems(
            date: newDate != null ? formatDate : 'احجز تاريخاً للخدمة',
            onPressedDate: () async {
              newDate = await showDatePicker(
                context: context,
                firstDate: selectedDate,
                lastDate: DateTime(2124),
              );
              if (newDate == null) return;
              setState(() {
                newDate = selectedDate;
                formatDate = intl.DateFormat('dd/MM/yyy').format(newDate!);
              });
            },
            dateTapped: newDate != null ? true : false,
            // ============================
            time: newTime != null ? formatTime : 'اختيار الوقت',
            onPressedTime: () async {
              newTime = await showTimePicker(
                context: context,
                initialTime: selectedTime,
              );
              if (newTime == null) return;
              setState(() {
                newTime = selectedTime;
                formatTime = newTime!.format(context);
              });
            },
            timeTapped: newTime != null ? true : false,
            // =================================
            location: 'تحديد الموقع',
          ),
          const DisplayLocation(),
          const SizedBox(height: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'رسوم الفحص: ${widget.data.price} ل.س ',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  textDirection: TextDirection.rtl,
                ),
                const SizedBox(height: 8),
                Text(
                  'الوصف : ${widget.data.serviceDescription}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  textDirection: TextDirection.rtl,
                ),
              ],
            ),
          ),
          CustomButton(
            title: 'تقدم',
            onTap: () {
              Future.delayed(
                const Duration(microseconds: 250),
                () => g.Get.to(
                  () => const AvailableFreelancerView(),
                  // () => FreelancerInfosView(
                  //   expert: data.expert,
                  // ),
                  transition: g.Transition.fadeIn,
                  duration: kDurationTransition,
                ),
              );
            },
            width: MediaQuery.of(context).size.width,
          ),
        ],
      ),
    );
  }
}
