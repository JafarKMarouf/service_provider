import 'package:flutter/material.dart';
import 'package:freelancer_app/core/utils/constant.dart';

import 'widgets/splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});
  
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kPrimaryColor,
      body: SplashViewBody(),
    );
  }
}
