import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:freelancer_app/core/utils/constant.dart';
import 'package:freelancer_app/features/home/presentation/view/desc_service_view.dart';
import 'package:freelancer_app/features/home/data/models/service_model/datum_service.dart';
import 'package:get/get.dart';

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
          () => DescServiceView(
            data: data,
          ),
          transition: Transition.fadeIn,
          duration: kDurationTransition,
        );
      },
      child: Card(
        elevation: 0,
        child: Column(
          children: [
            Expanded(
              child: CircleAvatar(
                radius: 90,
                backgroundColor: kPrimaryColor,
                child: CachedNetworkImage(
                  imageUrl: '${data.photo}',
                  placeholder: (context, url) {
                    return Text(
                      '${data.serviceName} loading..',
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
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
            const SizedBox(
              height: 2,
            ),
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
