import 'package:flutter/material.dart';
import 'package:freelancer_app/constant.dart';
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
    _loadingUserInfo();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: SlidingText(
            slidingAnimation: slidingAnimation,
          ),
        ),
      ],
    );
  }

  void initSlidingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 1500,
      ),
    );

    slidingAnimation = Tween<Offset>(
      begin: const Offset(2, 2),
      end: Offset.zero,
    ).animate(
      animationController,
    );
    animationController.forward();
  }

  _loadingUserInfo() async {
    token = await ApiService.getToken() ?? '';
    if (token == '') {
      navigateToLogin();
    } else {
      navigateToHome();
    }
  }

  void navigateToLogin() {
    Future.delayed(
      const Duration(
        seconds: 3,
      ),
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
      const Duration(
        seconds: 3,
      ),
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
