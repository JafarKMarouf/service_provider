import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:freelancer_app/features/home/data/models/service_model/datum.dart';

class ServiceType extends StatelessWidget {
  const ServiceType({
    super.key,
    required this.data,
  });
  final Datum data;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: .6,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 32.0,
            vertical: 16,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Image.network('${data.photo}'),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                clipBehavior: Clip.antiAlias,
                child: SvgPicture.asset('${data.photo}'),
                // child: Image.network(
                //   '${data.photo}',
                // ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              Text(
                '${data.serviceName}',
                // 'تصليح مكيفات',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              Text(
                '${data.price}',
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
    );
  }
}
