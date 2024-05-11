import 'package:flutter/material.dart';
import 'package:freelancer_app/core/widgets/custome_search_arrowback_bar.dart';

class BookmarkServicesBody extends StatelessWidget {
  const BookmarkServicesBody({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(
        right: 16,
        left: 16,
        top: 45,
        bottom: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          CustomeSearchArrowBackBar(),
          SizedBox(
            height: 16,
          ),
           Text(
            'الخدمات المرجعية',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w800,
            ),
          ),
           SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
