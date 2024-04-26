import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelancer_app/features/booked_services/data/models/book_service/datum_booked.dart';
import 'package:freelancer_app/features/booked_services/presentation/view_models/book_service_cubit/book_service_cubit.dart';
import '../../../../../core/widgets/custome_search_arrowback_bar.dart';
import 'on_going_list.dart';

class BookedServicesBody extends StatelessWidget {
  const BookedServicesBody({
    super.key,
    required this.booked,
  });
  final List<DatumBooked> booked;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 16,
        left: 16,
        top: 40,
        bottom: 30,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CustomeSearchArrowBackBar(),
          const SizedBox(
            height: 16,
          ),
          const Text(
            'الخدمات المحجوزة',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          BlocBuilder<BookServiceCubit, BookServiceState>(
            builder: (context, state) {
              if (state is BookServiceSuccess) {
                booked.addAll(state.bookService.data!.toList());
                return Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: booked.length,
                    itemBuilder: (context, index) {
                      return OnGoingList(
                        data: booked[index],
                      );
                    },
                  ),
                );
              } else if (state is BookServiceFailure) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height * .5,
                  child: Center(
                    child: Text(state.errMessage),
                  ),
                );
              } else {
                return SizedBox(
                  height: MediaQuery.of(context).size.height * .5,
                  child: const Center(child: CircularProgressIndicator()),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
