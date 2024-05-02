import 'package:flutter/material.dart';
import 'package:freelancer_app/core/utils/constant.dart';
import 'package:freelancer_app/core/widgets/custome_button.dart';
import 'package:freelancer_app/core/widgets/custome_service_bar.dart';
import 'package:freelancer_app/features/booked_services/data/models/book_service/service.dart';
import 'package:freelancer_app/features/home/presentation/view/widgets/custome_freelancer_image.dart';

class FreelancerInfosBody extends StatelessWidget {
  const FreelancerInfosBody({
    super.key,
    required this.freelanceInfos,
  });
  final Service freelanceInfos;
  @override
  Widget build(BuildContext context) {
    int rating = freelanceInfos.expert!.expertInfos!.rating;
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 14.0,
        vertical: 40,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          CustomeServiceBar(
            title: '${freelanceInfos.expert!.name}',
          ),
          const SizedBox(
            height: 16,
          ),
          Center(
            child: CutomeFreelancerImage(
              height: 120,
              image: '${freelanceInfos.expert!.expertInfos!.photo}',
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'الاسم :   ${freelanceInfos.expert!.name}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                textDirection: TextDirection.rtl,
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: List.generate(
                        rating, (index) {
                      return const Icon(
                        Icons.star,
                        color: kPrimaryColor,
                      );
                    }),
                  ),
                  Row(children: List.generate(
                       5-rating, (index) {
                    return const Icon(
                      Icons.star_border,
                      color: kPrimaryColor,
                    );
                  }),),
                  const Text(
                    'التقييم :   ',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    textDirection: TextDirection.rtl,
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                'الوصف :   ${freelanceInfos.expert!.expertInfos!.description}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                textDirection: TextDirection.rtl,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                'الشهادات الحاصل عليها :   '
                '${freelanceInfos.expert!.expertInfos!.certificate}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                textDirection: TextDirection.rtl,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                'الخدمات التي يقدمها :   '
                '${freelanceInfos.expert!.expertInfos!.certificate}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                textDirection: TextDirection.rtl,
              ),
              const SizedBox(
                height: 8,
              ),
            ],
          ),
          const Spacer(),
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
    );
  }
}
