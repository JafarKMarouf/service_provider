import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelancer_app/core/utils/constant.dart';
import 'package:freelancer_app/core/widgets/custome_search.dart';
import 'package:freelancer_app/features/booked_services/presentation/view/booked_services_list_view.dart';
import 'package:freelancer_app/features/home/data/models/service_model/datum.dart';
import 'package:freelancer_app/features/home/presentation/view/services_list_view.dart';
import 'package:freelancer_app/features/home/presentation/view/widgets/custome_home_bar.dart';
import 'package:freelancer_app/features/home/presentation/view_models/service_cubit/service_cubit.dart';
import 'package:get/get.dart' as g;
import 'fetch_services.dart';
import 'on_going_page_view.dart';
import 'service_grid_view.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  String? name ;
  bool loading = false;
  List<Datum> data = [];
  @override
  void initState() {
    // name = (await ApiService.getUserName())!;
    BlocProvider.of<ServiceCubit>(context).fetchService();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ServiceCubit, ServiceState>(
      listener: (context, state) {
        if (state is ServiceLoading) {
          loading = true;
        } else if (state is ServiceFailure) {
          loading = false;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errMessage),
            ),
          );
        } else if (state is ServiceSuccess) {
          loading = false;
          data.addAll(
            state.service.data!.toList(),
          );
        }
      },
      builder: (context, state) {
        return Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 40.0,
          horizontal: 16,
        ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 8,),
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
                        data: data,
                      ),
                      transition: g.Transition.fadeIn,
                      duration: kDurationTransition,
                    );
                  },
                ),
                loading
                    ? const CircularProgressIndicator()
                    : ServiceGridView(
                        data: data,
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
                const OnGoingPageView(
                    // data: data,
                    ),
              ],
            ),
          ),
        );
      },
    );
  }
}
