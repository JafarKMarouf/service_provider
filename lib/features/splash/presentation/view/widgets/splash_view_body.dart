import 'package:flutter/material.dart';
import 'package:freelancer_app/constant.dart';
import 'package:freelancer_app/features/auth/presentation/view/login_view.dart';
import 'package:get/get.dart';

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

  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
    navigateToLogin();
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
          child: SlidingText(slidingAnimation: slidingAnimation),
        ),
      ],
    );
  }

  void initSlidingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 3,
      ),
    );

    slidingAnimation =
        Tween<Offset>(begin: const Offset(2, 2), end: Offset.zero)
            .animate(animationController);
    animationController.forward();
  }

  void navigateToLogin() {
    Future.delayed(
      const Duration(seconds: 4),
          () {
        Get.to(
              () => const LoginView(),
          transition: Transition.zoom,
          duration: kDurationTransition,
        );
      },
    );
  }
}
