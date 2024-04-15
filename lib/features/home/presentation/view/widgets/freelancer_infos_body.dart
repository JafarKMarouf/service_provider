import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:freelancer_app/core/widgets/custome_button.dart';
import 'package:freelancer_app/core/widgets/custome_service_bar.dart';
import 'package:freelancer_app/features/booked_services/presentation/view/widgets/custome_style_service_infos.dart';
import 'package:freelancer_app/features/home/presentation/view/widgets/custome_freelancer_image.dart';

class FreelancerInfosBody extends StatelessWidget {
  const FreelancerInfosBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 14.0,
        vertical: 40,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const CustomeServiceBar(
              title: 'هشام حداد',
            ),
            const CutomeFreelancerImage(
              height: 120,
            ),
            const SizedBox(
              height: 24,
            ),
            const Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomeStyleServiceInfos(
                  title: 'الاسم : ',
                  info: 'هشام حداد',
                ),
                CustomeStyleServiceInfos(
                  title: 'التقييم : ',
                  rating: true,
                  clicked: false,
                ),
                CustomeStyleServiceInfos(
                  title: 'الوصف : ',
                  info: 'تتضمن خدمة العملاء إجراءات، مثل تقد'
                      'يم اقتراحات المنتجات أو استكشاف '
                      'المشكلات والشكاوى وحلها أو الرد ع'
                      'لى الأسئلة العامة.',
                ),
                CustomeStyleServiceInfos(
                  title: 'الشهادات الحاصل عليها : ',
                  info: 'تتضمن خدمة العملاء إجراءات، مثل تقد'
                      'يم اقتراحات المنتجات أو استكشاف '
                      'المشكلات والشكاوى وحلها أو الرد ع'
                      'لى الأسئلة العامة.',
                ),
                CustomeStyleServiceInfos(
                  title: 'الخدمات التي يقدمها : ',
                  info: 'تصليح مكيفات',
                ),
                CustomeStyleServiceInfos(
                  title: 'الاجرة : ',
                  info: '9000 ل.س/ساعه',
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 4.5,
            ),
            CustomButton(
              title: 'حجز',
              width: MediaQuery.of(context).size.width,
              onTap: () {},
            ),
            const SizedBox(
              height: 14,
            ),
          ],
        ),
      ),
    );
  }
}
