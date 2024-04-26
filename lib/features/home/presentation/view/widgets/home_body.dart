import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelancer_app/core/utils/constant.dart';
import 'package:freelancer_app/core/widgets/custome_search.dart';
import 'package:freelancer_app/features/booked_services/data/models/book_service/datum_booked.dart';
import 'package:freelancer_app/features/booked_services/presentation/view/booked_services_list_view.dart';
import 'package:freelancer_app/features/booked_services/presentation/view_models/book_service_cubit/book_service_cubit.dart';
import 'package:freelancer_app/features/home/data/models/service_model/datum_service.dart';
import 'package:freelancer_app/features/home/presentation/view/services_list_view.dart';
import 'package:freelancer_app/features/home/presentation/view/widgets/custome_home_bar.dart';
import 'package:freelancer_app/features/home/presentation/view_models/service_cubit/service_cubit.dart';
import 'package:get/get.dart' as g;
import 'fetch_services.dart';
import 'on_going_page_view.dart';
import 'service_grid_view.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({
    super.key,
  });
  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  String? name;
  bool loading = true;
  List<DatumService> services = [];
  List<DatumBooked> booked = [];

  @override
  void initState() {
    BlocProvider.of<ServiceCubit>(context).fetchService();
    BlocProvider.of<BookServiceCubit>(context).fetchBookServices();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 8,
        left: 8,
        top: 30,
        bottom: 15,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 8,
            ),
            const CustomeHomeBar(
              name: 'زبون4',
            ),
            const SizedBox(
              height: 15,
            ),
            CustomeSearch(
              width: MediaQuery.of(context).size.width,
            ),
            const SizedBox(
              height: 16,
            ),
            FetchServices(
              title: 'الخدمات المتاحة',
              onPressed: () {
                g.Get.to(
                  () => ServicesListView(
                    data: services,
                  ),
                  transition: g.Transition.fadeIn,
                  duration: kDurationTransition,
                );
              },
            ),
            BlocBuilder<ServiceCubit, ServiceState>(
              builder: (context, state) {
                if (state is ServiceSuccess) {
                  services.addAll(state.service.data!.toList());
                  return ServiceGridView(data: services);
                } else if (state is ServiceFailure) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height * .15,
                    child: Center(
                      child: Text(state.errMessage),
                    ),
                  );
                } else {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height * .15,
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
              },
            ),
            const SizedBox(
              height: 16,
            ),
            FetchServices(
              title: 'الخدمات المحجوزة',
              onPressed: () {
                g.Get.to(
                  () => const BookedServicesListView(),
                  transition: g.Transition.fadeIn,
                  duration: kDurationTransition,
                );
              },
            ),
            const SizedBox(
              height: 16,
            ),
            BlocBuilder<BookServiceCubit, BookServiceState>(
              builder: (context, state) {
                if (state is BookServiceSuccess) {
                  booked.addAll(state.bookService.data!.toList());
                  return OnGoingPageView(
                    data: booked,
                  );
                } else if (state is BookServiceFailure) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height * .15,
                    child: Center(
                      child: Text(state.errMessage),
                    ),
                  );
                } else {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height * .15,
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
