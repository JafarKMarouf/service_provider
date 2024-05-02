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
    //     BlocBuilder<BookServiceCubit, BookServiceState>(
    //       builder: (context, state) {
    //         if (state is BookServiceSuccess) {
    //           booked.addAll(state.bookService.data!.toList());
    //           return Expanded(
    //             child: ListView.builder(
    //               padding: EdgeInsets.zero,
    //               itemCount: booked.length,
    //               itemBuilder: (context, index) {
    //                 return OnGoingList(
    //                   data: booked[index],
    //                 );
    //               },
    //             ),
    //           );
    //         } else if (state is BookServiceFailure) {
    //           return SizedBox(
    //             height: MediaQuery.of(context).size.height * .5,
    //             child: Center(
    //               child: Text(state.errMessage),
    //             ),
    //           );
    //         } else {
    //           return SizedBox(
    //             height: MediaQuery.of(context).size.height * .5,
    //             child: const Center(
    //               child: CircularProgressIndicator(),
    //             ),
    //           );
    //         }
    //       },
    //     ),
    //   ],
    // ),
  }
}
