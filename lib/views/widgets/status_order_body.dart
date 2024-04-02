import 'package:flutter/material.dart';
import 'package:freelancer_app/core/utils/custome_button.dart';
import 'package:freelancer_app/views/widgets/custome_service_app_bar.dart';
import 'package:freelancer_app/views/widgets/service_infos.dart';

class StatusOrderBody extends StatelessWidget {
  const StatusOrderBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:40.0,right: 12,left: 12,bottom: 15),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const CustomeServiceAppBar(title: 'حالة الطلب'),
            const SizedBox(height: 16,),
            const ServiceInfos(),
            const SizedBox(height: 40,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomButton(
                  title: 'رفض',
                  width: MediaQuery.of(context).size.width/2.5,
                  onTap: (){},
                color: Colors.red,
                ),
                CustomButton(
                  title: 'قبول',
                  width: MediaQuery.of(context).size.width/2.5,
                  onTap: (){},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
