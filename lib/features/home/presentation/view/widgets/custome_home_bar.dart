import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:freelancer_app/core/utils/constant.dart';
import 'package:freelancer_app/features/profile/data/models/profile_model/customer_info.dart';
import 'package:shimmer/shimmer.dart';

class CustomeHomeBar extends StatelessWidget {
  const CustomeHomeBar({
    super.key,
    this.customerInfos,
    this.loading = false,
  });
  final bool loading;
  final CustomerInfo? customerInfos;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: Colors.grey[200],
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_active,
              size: 30,
              color: kPrimaryColor,
            ),
          ),
        ),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text(
                  'مرحبا',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                !loading
                    ? Text(
                        customerInfos!.customer!.name!,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: kPrimaryColor,
                        ),
                      )
                    : Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: Container(
                          width: 50,
                          height: 20,
                          color: Colors.white,
                        ),
                      ),
              ],
            ),
            const SizedBox(
              width: 5,
            ),
            !loading
                ? CircleAvatar(
                    radius: 32,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: CachedNetworkImage(
                        imageUrl: customerInfos!.photo!,
                        errorWidget: (context, url, error) {
                          return const Icon(
                            Icons.error,
                            color: Colors.white,
                          );
                        },
                      ),
                    ),
                  )
                : Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: const CircleAvatar(
                      radius: 32,
                    ),
                  ),
          ],
        )
      ],
    );
  }
}
