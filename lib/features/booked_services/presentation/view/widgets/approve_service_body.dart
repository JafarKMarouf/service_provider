import 'package:flutter/material.dart';
import 'package:freelancer_app/core/widgets/custome_service_bar.dart';
import 'package:freelancer_app/features/booked_services/presentation/view/widgets/approve_service_infos.dart';
import 'package:freelancer_app/features/booked_services/presentation/view/widgets/text_thanks.dart';

class ApproveServiceBody extends StatelessWidget {
  const ApproveServiceBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 40.0, horizontal: 12),
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomeServiceBar(title: 'تهانينا'),
            Column(
              children: [
                TextThanks(
                  text: 'شكرا لك على استخدام خدمتنا',
                ),
                TextThanks(
                  text: 'نتمنى أن تكون قد نالت إعجابك',
                ),
              ],
            ),
            SizedBox(height: 16,),
            ApproveServiceInfo(),
          ],
        ),
      ),
    );
  }
}

