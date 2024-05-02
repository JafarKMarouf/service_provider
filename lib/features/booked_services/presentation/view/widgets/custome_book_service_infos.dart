import 'package:flutter/material.dart';
import 'package:freelancer_app/core/utils/constant.dart';
import 'package:freelancer_app/features/booked_services/data/models/book_service/datum_booked.dart';
import 'package:freelancer_app/features/home/presentation/view/freelancer_infos_view.dart';
import 'package:get/get.dart' as g;
import 'package:intl/intl.dart' as intl;

class CustomeBookServiceInfo extends StatelessWidget {
  const CustomeBookServiceInfo({
    super.key,
    required this.data,
  });
  final DatumBooked data;

  @override
  Widget build(BuildContext context) {
    var formatDate = intl.DateFormat('dd/MM/yyy').format(data.createdAt!);
int rating = data.service!.expert!.expertInfos!.rating;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          InkWell(
            onTap: () {
              g.Get.to(
                () => FreelancerInfosView(freelanceInfos: data.service!),
                transition: g.Transition.fadeIn,
              );
            },
            child: Text(
              'اسم الفريلانسر :  ${data.service!.expert!.name}',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              textDirection: TextDirection.rtl,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: List.generate(
                    rating, (index) {
                  return const Icon(
                    Icons.star,
                    color: kPrimaryColor,
                  );
                }),
              ),
              Row(children: List.generate(
                  5-rating, (index) {
                return const Icon(
                  Icons.star_border,
                  color: kPrimaryColor,
                );
              }),),
              const Text(
                'التقييم :   ',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                textDirection: TextDirection.rtl,
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            'تاريخ الحجز :  $formatDate',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            'رسوم الخدمة :   ${data.service!.price} ل.س',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            'الوصف :   ${data.description}',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }
}
