import 'package:flutter/material.dart';
import 'package:freelancer_app/core/widgets/custome_infos_service_items.dart';
import 'package:freelancer_app/core/widgets/custome_search_arrowback_bar.dart';
import 'package:freelancer_app/features/booked_services/data/models/book_services/book_datum.dart';

import 'package:freelancer_app/features/booked_services/presentation/view/add_book_service/freelancer_infos_view/widget/custome_freelancer_item.dart';
import 'package:freelancer_app/features/main/data/models/service_model/expert.dart';
import 'package:intl/intl.dart';

class AvailableFreelancerView extends StatelessWidget {
  final DateTime date;
  final TimeOfDay time;
  final String location;
  final List<Expert> expert;
  final DatumBooked? booked;

  const AvailableFreelancerView({
    super.key,
    required this.date,
    required this.time,
    required this.location,
    required this.expert,
    this.booked,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(bottom: 15, right: 8, left: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Expanded(child: CustomeSearchArrowBackBar()),
            CustomeInfosServiceItems(
              date: DateFormat('dd/MM/yyy').format(date),
              time: time.format(context),
              location: location,
              dateTapped: true,
              timeTapped: true,
              locationTapped: true,
            ),
            const Text(
              'الفريلانسر المتاحين',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 8),
            Expanded(
              flex: 4,
              child: GridView.builder(
                  scrollDirection: Axis.vertical,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  padding: EdgeInsets.zero,
                  itemCount: expert.length,
                  itemBuilder: (context, index) {
                    return CustomeFreelancerItem(
                      expert: expert[index],
                      booked: booked,
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
