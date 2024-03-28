import 'package:flutter/material.dart';
import 'package:freelancer_app/views/widgets/custome_icon_service.dart';

class ServiceType extends StatelessWidget {
  const ServiceType({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Card(
        elevation: .6,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomeIconService(),
              SizedBox(height: 8.0,),
              Text(
                'تصليح مكيفات',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              Text(
                '9000 ل.س',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.green,
                    fontWeight: FontWeight.w600
                ),
                textDirection:TextDirection.rtl,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
