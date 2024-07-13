import 'package:flutter/material.dart';
import 'package:freelancer_app/core/widgets/custome_search_arrowback_bar.dart';

class CategoryItemView extends StatelessWidget {
  const CategoryItemView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.only(right: 8, left: 8, bottom: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            AspectRatio(aspectRatio: 7),
            CustomeSearchArrowBackBar(),
            SizedBox(height: 16),
            Text(
              'خدمات التصليح',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
            ),
            SizedBox(height: 6),
            // Expanded(child: ServicesGridView(data: services))
            // state is ServiceSuccess
            //     ? Expanded(child: ServicesGridView(data: services))
            //     : Expanded(
            //         child: Shimmer.fromColors(
            //           baseColor: Colors.grey[300]!,
            //           highlightColor: Colors.grey[100]!,
            //           child: GridView.builder(
            //             gridDelegate:
            //                 const SliverGridDelegateWithFixedCrossAxisCount(
            //               crossAxisCount: 3,
            //             ),
            //             itemCount: 15,
            //             padding: EdgeInsets.zero,
            //             itemBuilder: (context, index) {
            //               return Padding(
            //                 padding: const EdgeInsets.all(8.0),
            //                 child: Container(
            //                   height: 80,
            //                   width: 80,
            //                   decoration: BoxDecoration(
            //                     color: Colors.white,
            //                     borderRadius: BorderRadius.circular(15),
            //                   ),
            //                 ),
            //               );
            //             },
            //           ),
            //         ),
            //       ),
          ],
        ),
      ),
    );
  }
}
