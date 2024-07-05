import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelancer_app/features/main/data/models/service_model/datum_service.dart';
import 'package:freelancer_app/features/main/presentation/view_models/service_cubit/service_cubit.dart';
import 'package:shimmer/shimmer.dart';

import '../../fetch_services/widget/services_grid_view.dart';

class HandleServicesUi extends StatelessWidget {
  const HandleServicesUi({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ServiceCubit>(context).fetchService();
    List<DatumService> services = [];

    return Expanded(
      flex: 4,
      child: BlocBuilder<ServiceCubit, ServiceState>(
        builder: (context, state) {
          if (state is ServiceSuccess) {
            services.addAll(state.service.data!.toList());
            return ServicesGridView(data: services);
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
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
    );
  }
}
