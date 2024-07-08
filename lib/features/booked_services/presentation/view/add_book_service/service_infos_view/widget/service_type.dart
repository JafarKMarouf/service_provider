import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:freelancer_app/core/utils/constant.dart';
import 'package:freelancer_app/features/main/data/models/service_model/datum_service.dart';

class ServiceType extends StatelessWidget {
  final DatumService data;
  const ServiceType({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        color: kPrimaryColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 8),
          child: SizedBox(
            width: MediaQuery.sizeOf(context).width / 2,
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
                          style: const TextStyle(color: Colors.white),
                        ),
                      );
                    },
                    errorWidget: (context, url, error) {
                      return const Icon(Icons.error, color: Colors.white);
                    },
                  ),
                ),
                Text(
                  '${data.serviceName}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                Text(
                  '${data.price} ل.س',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
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
