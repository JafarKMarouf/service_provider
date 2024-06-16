import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:freelancer_app/core/utils/constant.dart';
import 'package:freelancer_app/features/booked_services/data/models/book_service/datum_booked.dart';
import 'package:shimmer/shimmer.dart';

class BookServiceType extends StatelessWidget {
  const BookServiceType({
    super.key,
    required this.data,
  });
  final DatumBooked data;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: .6,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
          child: SizedBox(
            width: 160,
            height: 160,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Card(
                    color: kPrimaryColor,
                    child: CachedNetworkImage(
                      fit: BoxFit.fill,
                      imageUrl: '${data.service!.photo}',
                      placeholder: (context, url) {
                        return Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(
                            width: 90,
                            height: 90,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              // color: kPrimaryColor,
                              color: Colors.white,
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
                ),
                const SizedBox(height: 8.0),
                Text(
                  '${data.service!.serviceName}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  '${data.service!.price.toString()} ل.س',
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
