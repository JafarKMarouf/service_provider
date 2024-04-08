import 'package:flutter/material.dart';
import 'package:freelancer_app/features/home/data/models/service_model/datum.dart';
import '../../../../booked_services/presentation/view/widgets/on_going_list.dart';

class OnGoingPageView extends StatelessWidget {
  const OnGoingPageView({super.key,required this.data});
  final List<Datum> data;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: PageView.builder(
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        reverse: true,
        itemBuilder: (context, index) {
          return OnGoingList(data: data[index],);
        },
      ),
    );
  }
}
