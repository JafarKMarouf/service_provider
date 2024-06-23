import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freelancer_app/core/constants/app_colors.dart';
import 'package:freelancer_app/core/constants/app_images.dart';
import 'package:freelancer_app/core/functions/input_validate.dart';
import 'package:freelancer_app/core/utils/constant.dart';
import 'package:freelancer_app/core/widgets/custome_text.dart';
import 'package:freelancer_app/features/auth/presentation/view/login_view.dart';
import 'package:freelancer_app/features/auth/presentation/view/widgets/custome_text_form_field.dart';
import 'package:freelancer_app/features/auth/presentation/view_model/auth_cubit/auth_cubit.dart';
import 'package:freelancer_app/core/widgets/custome_freelancer_image.dart';
import 'package:freelancer_app/features/profile/data/models/profile_model/customer_info.dart';
import 'package:freelancer_app/features/profile/presentation/view_models/profile_cubit/profile_cubit.dart';
import 'package:get/get.dart' as g;
import 'custome_profile_bar.dart';

class ProfileSuccessView extends StatefulWidget {
  const ProfileSuccessView({
    super.key,
    required this.customerInfo,
  });
  final List<CustomerInfo> customerInfo;

  @override
  State<ProfileSuccessView> createState() => _ProfileSuccessViewState();
}

class _ProfileSuccessViewState extends State<ProfileSuccessView> {
  bool editEmail = true;
  bool editPassword = true;
  bool passwordVisible = false;
  String passwordChange = '';
  String emailChange = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: BlocProvider.of<ProfileCubit>(context).formKey,
      autovalidateMode: BlocProvider.of<ProfileCubit>(context).autovalidateMod,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          CustomeProfileBar(
            title: '${widget.customerInfo[0].customer!.name}',
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
              image: widget.customerInfo[0].photo,
            ),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomeText(
                text: '${widget.customerInfo[0].customer!.name}',
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
                  setState(() {});
                },
                child: editEmail
                    ? SvgPicture.asset(
                        AppImages.editsvg,
                      )
                    : SvgPicture.asset(
                        AppImages.editsvg,
                        width: 24,
                      ),
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
            hintText: '${widget.customerInfo[0].customer!.email}',
            prefix: InkWell(
              onTap: () {
                if (emailChange != '') {
                  if (BlocProvider.of<ProfileCubit>(context)
                      .formKey
                      .currentState!
                      .validate()) {
                    BlocProvider.of<ProfileCubit>(context).updateProfile(
                      userId: widget.customerInfo[0].customer!.id!,
                      body: {
                        'email': BlocProvider.of<ProfileCubit>(context)
                            .emailAddress!
                            .text,
                      },
                    );
                    BlocProvider.of<ProfileCubit>(context)
                        .emailAddress!
                        .clear();
                  }
                } else {
                  BlocProvider.of<ProfileCubit>(context).autovalidateMod =
                      AutovalidateMode.always;
                  setState(() {});
                }
              },
              child: Image.asset(
                AppImages.email,
                width: 34,
              ),
            ),
            readOnly: editEmail,
            customController:
                BlocProvider.of<ProfileCubit>(context).emailAddress,
            validate: (value) => validate(
              type: 'email',
              value: value!,
            ),
            onChange: (val) {
              emailChange = val;
            },
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  editPassword = !editPassword;
                  setState(() {});
                },
                child: editPassword
                    ? SvgPicture.asset(AppImages.editsvg)
                    : SvgPicture.asset(
                        AppImages.editsvg,
                        width: 24,
                      ),
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
            customController: BlocProvider.of<ProfileCubit>(context).password,
            type: TextInputType.visiblePassword,
            isSuffix: false,
            hintText: 'تغيير كلمة السر',
            prefix: InkWell(
              onTap: () {
                if (passwordChange != '') {
                  if (BlocProvider.of<ProfileCubit>(context)
                      .formKey
                      .currentState!
                      .validate()) {
                    BlocProvider.of<ProfileCubit>(context).updateProfile(
                      userId: widget.customerInfo[0].customer!.id!,
                      body: {
                        'password': BlocProvider.of<ProfileCubit>(context)
                            .password!
                            .text,
                      },
                    );
                    BlocProvider.of<ProfileCubit>(context).password!.clear();
                  }
                } else {
                  BlocProvider.of<ProfileCubit>(context).autovalidateMod =
                      AutovalidateMode.always;
                  setState(() {});
                }
              },
              child: Image.asset(AppImages.lock),
            ),
            suffix: InkWell(
              onTap: () {
                passwordVisible = !passwordVisible;
                setState(() {});
              },
              child: !passwordVisible
                  ? Image.asset(AppImages.visible)
                  : const Icon(
                      Icons.remove_red_eye_rounded,
                      color: AppColors.dustyGray,
                    ),
            ),
            readOnly: editPassword,
            isObscure: !passwordVisible,
            validate: (value) => validate(
              type: 'password',
              value: value!,
            ),
            onChange: (val) {
              passwordChange = val;
            },
          ),
          const SizedBox(height: 24),
          // CustomButton(
          //   title: 'update profile',
          //   width: double.infinity,
          //   onTap: () {
          //     if (emailChange != '' || passwordChange != '') {
          //       if (BlocProvider.of<ProfileCubit>(context)
          //           .formKey
          //           .currentState!
          //           .validate()) {
          //         BlocProvider.of<ProfileCubit>(context)
          //             .updateProfile(
          //           userId: customerInfo[0].customer!.id!,
          //           body: {
          //             // 'email': BlocProvider.of<ProfileCubit>(context)
          //             //     .emailAddress!
          //             //     .text,
          //             'password':
          //                 BlocProvider.of<ProfileCubit>(context)
          //                     .password!
          //                     .text,
          //           },
          //         );
          //         BlocProvider.of<ProfileCubit>(context)
          //             .emailAddress!
          //             .clear();
          //         BlocProvider.of<ProfileCubit>(context)
          //             .password!
          //             .clear();
          //       }
          //     } else {
          //       BlocProvider.of<ProfileCubit>(context)
          //           .autovalidateMod = AutovalidateMode.always;
          //       setState(() {});
          //     }
          //   },
          // )
        ],
      ),
    );
  }
}
