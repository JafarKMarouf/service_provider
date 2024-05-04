import 'package:flutter/material.dart';
import 'package:freelancer_app/core/widgets/custome_service_bar.dart';
import 'package:freelancer_app/features/home/data/models/service_model/datum_service.dart';
import 'package:freelancer_app/features/home/presentation/view/widgets/service_grid_view.dart';
import 'package:shimmer/shimmer.dart';

class ServiceListBody extends StatelessWidget {
  const ServiceListBody({
    super.key,
    required this.data,
    this.loading = true,
  });
  final List<DatumService> data;
  final bool loading;
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
          !loading
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
    );
  }
}
