import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:freelancer_app/core/utils/constant.dart';
import 'package:freelancer_app/features/booked_services/presentation/view/add_book_service/service_infos_view/service_infos_view.dart';
import 'package:freelancer_app/features/main/data/models/service_model/datum_service.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class CustomeServiceItem extends StatelessWidget {
  const CustomeServiceItem({
    super.key,
    required this.data,
  });
  final DatumService data;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
          () => ServiceInfosView(data: data),
          transition: Transition.fadeIn,
          duration: kDurationTransition,
        );
      },
      child: Card(
        elevation: 0,
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: CachedNetworkImage(
                  imageUrl: '${data.photo}',
                  placeholder: (context, url) {
                    return Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        width: 90,
                        height: 90,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                      ),
                    );
                  },
                  errorWidget: (context, url, error) {
                    return const Icon(
                      Icons.error,
                      color: Colors.white,
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 2),
            Text(
              data.serviceName!,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
