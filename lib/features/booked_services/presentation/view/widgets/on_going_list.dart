import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:freelancer_app/core/utils/constant.dart';
import 'package:freelancer_app/features/booked_services/data/models/book_service/datum_booked.dart';
import 'package:freelancer_app/features/booked_services/presentation/view/booking_infos_view.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' as format;

class OnGoingList extends StatelessWidget {
  const OnGoingList({
    super.key,
    required this.data,
  });
  final DatumBooked data;

  @override
  Widget build(BuildContext context) {
    var formatDate = format.DateFormat('dd/MM/yyy').format(data.deliveryTime!);
    var formatTime = format.DateFormat('hh:mm aa').format(data.deliveryTime!);
    return GestureDetector(
      onTap: () {
        Get.to(
          () => BookingInfosView(
            data: data,
          ),
          transition: Transition.fadeIn,
          duration: kDurationTransition,
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(
          right: 2,
          left: 4,
          top: 8,
          bottom: 4,
        ),
        child: Card(
          margin: EdgeInsets.zero,
          elevation: 1,
          child: SizedBox(
            width: MediaQuery.of(context).size.width - 44,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 16.0,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SvgPicture.asset(
                        'assets/images/img_bookmark.svg',
                        height: 34,
                        colorFilter: const ColorFilter.mode(
                          kPrimaryColor,
                          BlendMode.srcIn,
                        ),
                      ),
                      const Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '${data.service!.serviceName}',
                            style: const TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            '${data.service!.expert!.name}',
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 16.0,
                      ),
                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: kPrimaryColor,
                        ),
                        child: CachedNetworkImage(
                          imageUrl: '${data.service!.photo}',
                          placeholder: (context, url) {
                            return Center(
                              child: Text(
                                '${data.service!.serviceName} image',
                                style: const TextStyle(
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
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const SizedBox(
                    child: Divider(
                      color: Colors.grey,
                      thickness: 3,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.orangeAccent,
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 4,
                        ),
                        child: const Text(
                          'فحص',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            formatDate,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Text(
                            formatTime,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            '${data.service!.expert!.expertInfos!.country}',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            '${data.service!.price} ل.س',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                            textDirection: TextDirection.rtl,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 4, horizontal: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: kPrimaryColor,
                                width: 3,
                              ),
                            ),
                            child: const Text(
                              'في الموقع',
                              style: TextStyle(
                                color: kPrimaryColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
