import 'package:flutter/material.dart';
import 'package:freelancer_app/views/widgets/custome_service_app_bar.dart';
import 'package:freelancer_app/views/widgets/text_thanks.dart';

import '../../../../../views/widgets/approve_service_infos.dart';

class ApproveServiceBody extends StatelessWidget {
  const ApproveServiceBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 60.0, horizontal: 12),
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomeServiceAppBar(title: 'تهانينا'),
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

