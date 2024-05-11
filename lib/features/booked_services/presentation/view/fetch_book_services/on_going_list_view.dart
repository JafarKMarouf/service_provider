import 'package:flutter/material.dart';
import 'package:freelancer_app/features/booked_services/data/models/book_service/datum_booked.dart';
import 'widgets/on_going_list.dart';

class OnGoingListView extends StatelessWidget {
  const OnGoingListView({
    super.key,
    required this.data,
  });
  final List<DatumBooked> data;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        reverse: true,
        itemCount: data.length,
        itemBuilder: (context, index) {
          return OnGoingList(data: data[index]);
        },
      ),
    );
  }
}
