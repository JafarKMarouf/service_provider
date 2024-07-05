import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelancer_app/features/booked_services/data/models/book_service/datum_booked.dart';
import 'package:freelancer_app/features/booked_services/presentation/view/fetch_book_services/on_going_list_view.dart';
import 'package:freelancer_app/features/booked_services/presentation/view_models/book_service_cubit/book_service_cubit.dart';
import 'package:shimmer/shimmer.dart';

class HandleBookServiceUi extends StatelessWidget {
  const HandleBookServiceUi({super.key});

  @override
  Widget build(BuildContext context) {
    List<DatumBooked> booked = [];
    BlocProvider.of<BookServiceCubit>(context).fetchBookServices();

    return Expanded(
      flex: 4,
      child: BlocBuilder<BookServiceCubit, BookServiceState>(
        builder: (context, state) {
          if (state is BookServiceSuccess) {
            booked.addAll(state.bookService.data!.toList());
            return OnGoingListView(data: booked);
          } else if (state is BookServiceFailure) {
            return SizedBox(
              height: MediaQuery.of(context).size.height * .15,
              child: Center(child: Text(state.errMessage)),
            );
          } else {
            return SizedBox(
              height: 220,
              child: Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Padding(
                  padding: const EdgeInsets.only(
                    right: 2,
                    left: 4,
                    top: 8,
                    bottom: 2,
                  ),
                  child: Card(
                    margin: EdgeInsets.zero,
                    child: ListTile(
                      title: Container(
                        height: 40,
                        width: double.infinity,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
