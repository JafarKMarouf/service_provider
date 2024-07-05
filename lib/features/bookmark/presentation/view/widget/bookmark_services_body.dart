import 'package:flutter/material.dart';
import 'package:freelancer_app/core/widgets/custome_search_arrowback_bar.dart';

class BookmarkServicesBody extends StatelessWidget {
  const BookmarkServicesBody({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(right: 8, left: 8, bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          AspectRatio(aspectRatio: 7),
          CustomeSearchArrowBackBar(),
          SizedBox(height: 6),
          Text(
            'الخدمات المرجعية',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
          ),
          SizedBox(height: 6),
        ],
      ),
    );
  }
}
