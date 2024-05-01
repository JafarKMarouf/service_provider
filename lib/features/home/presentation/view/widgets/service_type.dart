import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:freelancer_app/core/utils/constant.dart';
import 'package:freelancer_app/features/home/data/models/service_model/datum_service.dart';

class ServiceType extends StatelessWidget {
  const ServiceType({
    super.key,
    required this.data,
  });
  final DatumService data;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: .4,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 32.0,
            vertical: 8,
          ),
          child: SizedBox(
            width: 160,
            height: 160,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: CachedNetworkImage(
                    fit: BoxFit.fill,
                    imageUrl: '${data.photo}',
                    placeholder: (context, url) {
                      return Center(
                        child: Text(
                          '${data.serviceName} image',
                          style: const TextStyle(
                            color: kPrimaryColor,
                          ),
                        ),
                      );
                    },
                    errorWidget: (context, url, error) {
                      return const Icon(
                        Icons.error,
                        color: kPrimaryColor,
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Text(
                  '${data.serviceName}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Text(
                  '${data.price} ل.س',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.green,
                    fontWeight: FontWeight.w600,
                  ),
                  textDirection: TextDirection.rtl,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
