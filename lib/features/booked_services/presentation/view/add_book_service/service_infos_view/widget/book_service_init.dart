import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelancer_app/features/booked_services/presentation/view/add_book_service/service_infos_view/widget/service_type.dart';
import 'package:freelancer_app/features/booked_services/presentation/view_models/book_service_cubit/book_service_cubit.dart';
import 'package:freelancer_app/features/booked_services/presentation/view_models/pick_book_service_infos_cubit/pick_book_service_infos_cubit.dart';
import 'package:freelancer_app/features/main/data/models/service_model/service_datum.dart';
import 'package:freelancer_app/features/profile/presentation/view_models/profile_cubit/profile_cubit.dart';
import 'package:get/get.dart';
import 'package:freelancer_app/core/widgets/custome_service_bar.dart';
import 'package:freelancer_app/features/booked_services/presentation/view/add_book_service/service_infos_view/widget/service_infos_book.dart';
import 'package:freelancer_app/core/widgets/custome_button.dart';
import 'package:freelancer_app/features/booked_services/presentation/view/add_book_service/freelancer_infos_view/available_freelancer_view.dart';
import 'package:intl/intl.dart' as intl;

class BookServiceInit extends StatelessWidget {
  final ServiceDatum data;

  const BookServiceInit({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<PickBookServiceInfosCubit>(context);
    var booked = BlocProvider.of<BookServiceCubit>(context);
    booked.serviceId = data.id;
    booked.serviceName = data.serviceName;
    booked.photo = data.photo;
    booked.customerId = BlocProvider.of<ProfileCubit>(context).customerId;
    return Padding(
      padding: const EdgeInsets.only(right: 8, left: 8, bottom: 15),
      child: Column(
        children: [
          const Expanded(child: CustomeServiceBar(title: "وصف الخدمة")),
          Expanded(flex: 2, child: ServiceType(data: data)),
          const SizedBox(height: 16),
          const Expanded(child: ServiceInfosBook()),
          const SizedBox(height: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'رسوم الفحص: ${data.expert!.first.price} ل.س ',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Poppins SemiBold',
                    color: Color(0xff252525),
                  ),
                  textDirection: TextDirection.rtl,
                ),
                const SizedBox(height: 8),
                Text(
                  'الوصف : ${data.serviceDescription}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  textDirection: TextDirection.rtl,
                ),
              ],
            ),
          ),
          CustomButton(
            title: 'تقدم',
            onTap: () {
              if (cubit.newDate == null) {
                Get.snackbar(
                  'warning',
                  'you have to set date first',
                );
              } else if (cubit.newTime == null) {
                Get.snackbar(
                  'warning',
                  'you have to set time first',
                );
              } else if (cubit.currentPosition == null) {
                Get.snackbar(
                  'warning',
                  'you have to set your location first',
                );
              } else {
                Get.to(
                  () {
                    var formatDate =
                        intl.DateFormat('dd/MM/yyy').format(cubit.newDate!);
                    booked.deliveryDate = formatDate;

                    booked.deliveryTime = cubit.newTime!.format(context);
                    booked.currentPosition = cubit.currentPosition;

                    return AvailableFreelancerView(expert: data.expert!);
                  },
                );
              }
            },
            width: MediaQuery.of(context).size.width,
          ),
        ],
      ),
    );
  }
}
