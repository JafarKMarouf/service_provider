import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelancer_app/core/widgets/custome_service_bar.dart';
import 'package:freelancer_app/features/main/data/models/service_model/datum_service.dart';
import 'package:freelancer_app/features/main/presentation/view/fetch_services/widget/service_grid_view.dart';
import 'package:freelancer_app/features/main/presentation/view_models/service_cubit/service_cubit.dart';
import 'package:shimmer/shimmer.dart';

class ServiceListBody extends StatelessWidget {
  const ServiceListBody({
    super.key,
    required this.data,
  });
  final List<DatumService> data;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ServiceCubit,ServiceState>(
      builder:(context,state)=> Padding(
        padding: const EdgeInsets.only(
          right: 16,
          left: 16,
          top: 40,
          bottom: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const CustomeServiceBar(title: 'title'),
            const SizedBox(
              height: 15,
            ),
            const Text(
              'الخدمات المتاحة',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            state is ServiceSuccess
                ? Expanded(
                    child: ServiceGridView(
                      data: data,
                    ),
                  )
                : Expanded(
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                        ),
                        itemCount: 15,
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
                  ),
          ],
        ),
      ),
    );
  }
}
