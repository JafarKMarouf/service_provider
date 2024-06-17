import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freelancer_app/core/constants/app_colors.dart';
import 'package:freelancer_app/core/constants/app_images.dart';
import 'package:freelancer_app/core/utils/constant.dart';
import 'package:freelancer_app/core/widgets/custome_button.dart';
import 'package:freelancer_app/core/widgets/custome_text.dart';
import 'package:freelancer_app/features/auth/presentation/view/login_view.dart';
import 'package:freelancer_app/features/auth/presentation/view/widgets/custome_text_form_field.dart';
import 'package:freelancer_app/features/auth/presentation/view_model/auth_cubit/auth_cubit.dart';
import 'package:freelancer_app/core/widgets/custome_freelancer_image.dart';
import 'package:freelancer_app/features/profile/data/models/profile_model/customer_info.dart';
import 'package:freelancer_app/features/profile/presentation/view_models/profile_cubit/profile_cubit.dart';
import 'package:get/get.dart' as g;
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
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

  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController emailAddress = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool loading = false;
    return Form(
      key: formKey,
      child: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {
          if (state is ProfileLoading) {
            loading = true;
          } else if (state is ProfileFailure) {
            loading = false;
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errMessage),
                duration: const Duration(seconds: 3),
              ),
            );
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall: loading,
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
                    image: widget.customerInfo[0].photo!,
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
                  hintText: '${widget.customerInfo[0].customer!.email}',
                  prefix: Image.asset(AppImages.email),
                  readOnly: editEmail,
                  customController: emailAddress,
                  validate: (value) {
                    if (value!.isEmpty) {
                      return "هذا الحقل مطلوب";
                    }
                    return null;
                  },
            
                  // onSubmit: (value) {
                  //   // log('===========before submit :$value==========');
                  //   BlocProvider.of<ProfileCubit>(context).updateProfile(
                  //     userId: widget.customerInfo[0].customer!.id!,
                  //     // userId: 1,
                  //     email: value.toString(),
                  //   );
                  //   return null;
                  // },
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        editPassword = !editPassword;
                        setState(() {});
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
                  // onSubmit: (value) {
                  //   // BlocProvider.of<ProfileCubit>(context).
                  // },
                  // validate: (value) {
                  //   if (value!.isEmpty) {
                  //     return "هذا الحقل مطلوب";
                  //   }
                  //   return null;
                  // },
            
                  customController: password,
                  type: TextInputType.visiblePassword,
                  isSuffix: false,
                  hintText: 'تغيير كلمة السر',
                  suffix: Image.asset(AppImages.lock),
                  prefix: InkWell(
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
                ),
                const SizedBox(height: 24),
                CustomButton(
                  title: 'update profile',
                  width: double.infinity,
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      BlocProvider.of<ProfileCubit>(context).updateProfile(
                        userId: widget.customerInfo[0].customer!.id!,
                        email: emailAddress.text,
                        password: password.text,
                      );
                    } else {
                      // autoValidate = AutovalidateMode.always;
                      // setState(() {});
                    }
                  },
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
