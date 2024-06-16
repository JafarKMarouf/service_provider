import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:freelancer_app/core/utils/constant.dart';
import 'package:freelancer_app/core/utils/api_service.dart';
import 'package:freelancer_app/core/widgets/custome_nav_bar.dart';
import 'package:freelancer_app/features/auth/presentation/view/login_view.dart';
import 'package:get/get.dart' as g;

import 'sliding_text.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;
  late String token = '';

  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
    loadingUserInfo();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 5),
      child: SlidingText(slidingAnimation: slidingAnimation),
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

  void loadingUserInfo() async {
    token = await ApiService.getToken() ?? '';
    log('====================token===$token===============');
    if (token == '') {
      navigateToLogin();
    } else {
      navigateToHome();
    }
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
}
