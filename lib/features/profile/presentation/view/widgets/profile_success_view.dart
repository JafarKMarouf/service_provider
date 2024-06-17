import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freelancer_app/core/constants/app_images.dart';
import 'package:freelancer_app/core/utils/constant.dart';
import 'package:freelancer_app/core/widgets/custome_text.dart';
import 'package:freelancer_app/features/auth/presentation/view/login_view.dart';
import 'package:freelancer_app/features/auth/presentation/view/widgets/custome_text_form_field.dart';
import 'package:freelancer_app/features/auth/presentation/view_model/auth_cubit/auth_cubit.dart';
import 'package:freelancer_app/core/widgets/custome_freelancer_image.dart';
import 'package:freelancer_app/features/profile/data/models/profile_model/customer_info.dart';
import 'package:get/get.dart' as g;
import 'custome_profile_bar.dart';

class ProfileSuccessView extends StatelessWidget {
  const ProfileSuccessView({
    super.key,
    required this.customerInfo,
  });
  final List<CustomerInfo> customerInfo;

  @override
  Widget build(BuildContext context) {
    bool editEmail = false;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        CustomeProfileBar(
          title: '${customerInfo[0].customer!.name}',
          onPressed: () {
            BlocProvider.of<AuthCubit>(context).logout();
            Future.delayed(
              const Duration(seconds: 3),
              () {
                g.Get.offAll(
                  () => const LoginView(),
                  transition: g.Transition.fadeIn,
                  duration: kDurationTransition,
                );
              },
            );
          },
        ),
        const SizedBox(height: 24),
        Center(
          child: CustomeFreelancerImage(
            height: 120,
            image: customerInfo[0].photo!,
          ),
        ),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomeText(
              text: '${customerInfo[0].customer!.name}',
              size: 14,
              weight: FontWeight.w600,
              color: const Color(0xff252525),
            ),
            const SizedBox(width: 16),
            const CustomeText(
              text: 'الاسم :',
              size: 17,
              weight: FontWeight.w800,
              fontFamily: 'Poppins SemiBold',
              color: Color(0xff252525),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                editEmail = !editEmail;
                log('edit email');
              },
              child: SvgPicture.asset(AppImages.editsvg),
            ),
            const CustomeText(
              text: 'الإيميل المرتبط :',
              size: 16,
              weight: FontWeight.w800,
              fontFamily: 'Poppins SemiBold',
              color: Color(0xff252525),
            ),
          ],
        ),
        const SizedBox(height: 8),
        CustomeTextFormField(
          type: TextInputType.emailAddress,
          isSuffix: false,
          hintText: '${customerInfo[0].customer!.email}',
          prefix: Image.asset(AppImages.email),
          readOnly: editEmail,
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                log('edit password');
              },
              child: SvgPicture.asset(AppImages.editsvg),
            ),
            const CustomeText(
              text: 'كلمة المرور :',
              size: 16,
              weight: FontWeight.w800,
              fontFamily: 'Poppins SemiBold',
              color: Color(0xff252525),
            ),
          ],
        ),
        const SizedBox(height: 8),
        CustomeTextFormField(
          type: TextInputType.visiblePassword,
          isSuffix: false,
          hintText: 'تغيير كلمة السر',
          suffix: Image.asset(AppImages.lock),
          prefix: Image.asset(AppImages.visible),
        ),
      ],
    );
  }
}
