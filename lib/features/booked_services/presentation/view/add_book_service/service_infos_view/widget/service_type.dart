import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:freelancer_app/core/utils/constant.dart';

import 'package:freelancer_app/features/main/data/models/service_model/datum_service.dart';
import 'package:shimmer/shimmer.dart';

class ServiceType extends StatelessWidget {
  final DatumService data;
  const ServiceType({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: .6,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
        child: SizedBox(
          // width: MediaQuery.sizeOf(context).width / 1.9,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: CachedNetworkImage(
                  imageUrl: '${data.photo}',
                  color: kPrimaryColor,
                  placeholder: (context, url) => Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      width: MediaQuery.sizeOf(context).width / 2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  errorWidget: (context, url, error) => const Icon(
                    Icons.error,
                    color: kPrimaryColor,
                    size: 45,
                  ),
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                '${data.serviceName}',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: kPrimaryColor,
                  // color: Colors.white,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                '${data.price} ل.س',
                style: const TextStyle(
                  fontSize: 18,
                  color: kPrimaryColor,
                  // color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
                textDirection: TextDirection.rtl,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
