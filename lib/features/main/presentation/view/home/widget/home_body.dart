import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelancer_app/core/utils/constant.dart';
import 'package:freelancer_app/core/widgets/custome_search.dart';
import 'package:freelancer_app/features/booked_services/data/models/book_service/datum_booked.dart';
import 'package:freelancer_app/features/booked_services/presentation/view/fetch_book_services/booked_services_list_view.dart';
import 'package:freelancer_app/features/booked_services/presentation/view_models/book_service_cubit/book_service_cubit.dart';
import 'package:freelancer_app/features/main/presentation/view/fetch_services/services_list_view.dart';
import 'package:freelancer_app/features/main/presentation/view/fetch_services/widget/service_grid_view.dart';
import 'package:freelancer_app/features/main/presentation/view/home/widget/custome_home_bar.dart';
import 'package:freelancer_app/features/main/presentation/view_models/service_cubit/service_cubit.dart';
import 'package:freelancer_app/features/profile/data/models/profile_model/customer_info.dart';
import 'package:freelancer_app/features/profile/presentation/view_models/profile_cubit/profile_cubit.dart';
import 'package:freelancer_app/features/main/data/models/service_model/datum_service.dart';
import 'package:get/get.dart' as g;
import 'package:shimmer/shimmer.dart';
import '../../../../../../core/widgets/fetch_services.dart';
import '../../../../../booked_services/presentation/view/fetch_book_services/on_going_list_view.dart';

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
  List<CustomerInfo> customerInfo = [];

  @override
  void initState() {
    BlocProvider.of<ServiceCubit>(context).fetchService();
    BlocProvider.of<BookServiceCubit>(context).fetchBookServices();
    BlocProvider.of<ProfileCubit>(context).showProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8, left: 8, bottom: 15),
      child: Column(
        children: [
          const Expanded(flex: 1, child: SizedBox()),
          BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, state) {
              if (state is ProfileSuccess) {
                customerInfo
                    .addAll(state.profileModel!.customerInfos!.toList());
                // log('${customerInfo[0].customer}');
                return CustomeHomeBar(customerInfos: customerInfo[0]);
              }
              return const CustomeHomeBar(loading: true);
            },
          ),
          const SizedBox(height: 15),
          CustomeSearch(width: MediaQuery.of(context).size.width),
          const SizedBox(height: 16),
          FetchServices(
            title: 'الخدمات المتاحة',
            onPressed: () {
              g.Get.to(
                () => ServicesListView(data: services, loading: !loading),
                transition: g.Transition.fadeIn,
                duration: kDurationTransition,
              );
            },
          ),
          Expanded(
            flex: 3,
            child: BlocBuilder<ServiceCubit, ServiceState>(
              builder: (context, state) {
                if (state is ServiceSuccess) {
                  services.addAll(state.service.data!.toList());
                  return ServiceGridView(data: services);
                } else if (state is ServiceFailure) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height * .15,
                    child: Center(child: Text(state.errMessage)),
                  );
                } else {
                  return SizedBox(
                    height: 135,
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                        ),
                        itemCount: 3,
                        padding: EdgeInsets.zero,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                }
              },
            ),
          ),
          const SizedBox(height: 16),
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
          const SizedBox(height: 16),
          Expanded(
            flex: 3,
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
          ),
        ],
      ),
    );
  }
}
