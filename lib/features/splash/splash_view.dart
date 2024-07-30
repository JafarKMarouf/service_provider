import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:freelancer_app/core/constants/app_colors.dart';
import 'package:freelancer_app/core/constants/app_storage.dart';
import 'package:freelancer_app/core/utils/constant.dart';
import 'package:freelancer_app/core/widgets/custome_nav_bar.dart';
import 'package:freelancer_app/features/auth/presentation/view/email_verify_view.dart';
import 'package:freelancer_app/features/auth/presentation/view/login_view.dart';
import 'package:freelancer_app/features/splash/widgets/sliding_text.dart';
import 'package:get/get.dart' as g;

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
    loadingUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 5),
        child: SlidingText(slidingAnimation: slidingAnimation),
      ),
    );
  }

  void initSlidingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    slidingAnimation = Tween<Offset>(
      begin: const Offset(0, 2),
      end: Offset.zero,
    ).animate(animationController);
    animationController.forward();
  }

  Future<void> loadingUserInfo() async {
    var token = await AppStorage.getToken();
    var isVerifed = await AppStorage.getVerifiedEmail();
    var getEmail = await AppStorage.getEmail();

    log('======token:$token===');
    log('======verify:$isVerifed===');
    log('======email:$getEmail===');

    if (token != null && isVerifed != null) {
      navigateToHome();
    } else {
      if (isVerifed == null && token != null) {
        navigateToVerify();
      } else {
        navigateToLogin();
      }
    }
  }

  void navigateToHome() {
    Future.delayed(
      const Duration(milliseconds: 2000),
      () {
        g.Get.offAll(
          () => const CustomeNavBar(),
          transition: g.Transition.fadeIn,
          duration: kDurationTransition,
        );
      },
    );
  }

  void navigateToVerify() {
    Future.delayed(
      const Duration(milliseconds: 2000),
      () {
        g.Get.offAll(
          () => const EmailVerifyView(),
          transition: g.Transition.fadeIn,
          duration: kDurationTransition,
        );
      },
    );
  }

  void navigateToLogin() {
    Future.delayed(
      const Duration(milliseconds: 2000),
      () {
        g.Get.offAll(
          () => const LoginView(),
          transition: g.Transition.fadeIn,
          duration: kDurationTransition,
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }
}
