import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freelancer_app/constant.dart';
import 'package:freelancer_app/features/home/data/models/service_model/datum.dart';
import 'package:freelancer_app/features/home/presentation/view/widgets/custome_icon_service.dart';

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
          padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  width: 90,
                  height: 80,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: kPrimaryColor),
                  // child: Text('${data.photo}'),
                  child: SvgPicture.network('${data.photo}')
                  // child: Image.network('${data.photo}'),
                  // child: SvgPicture.asset('assets/images/img_button_google_primary.svg'),
                  ),
              // CustomeIconService(),
              SizedBox(
                height: 8.0,
              ),
              Text(
                '${data.serviceName}',
                // 'تصليح مكيفات',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              Text(
                '${data.price}',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.green,
                    fontWeight: FontWeight.w600),
                textDirection: TextDirection.rtl,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
