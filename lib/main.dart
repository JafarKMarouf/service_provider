import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelancer_app/core/utils/constant.dart';
import 'package:freelancer_app/core/utils/bloc_observer.dart';
import 'package:freelancer_app/features/booked_services/presentation/view/approve_service_view.dart';
import 'package:freelancer_app/features/booked_services/presentation/view/booking_infos_view.dart';
import 'package:freelancer_app/features/home/presentation/view/available_freelancer_view.dart';
import 'package:get/get.dart';
import 'package:freelancer_app/core/utils/api_service.dart';
import 'package:freelancer_app/features/auth/data/repos/auth_repo_impl.dart';
import 'package:freelancer_app/features/auth/presentation/view_model/auth_cubit/auth_cubit.dart';
import 'package:dio/dio.dart';

void main() {
  Bloc.observer = AppBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(
            AuthRepoImpl(
              ApiService(
                Dio(),
              ),
            ),
          ),
        )
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.light,
          fontFamily: 'Poppins',
          primaryColorLight: kPrimaryColor,
        ),
        // home: const SplashView(),
        home: const AvailableFreelancerView(),
        // home: const ApproveServiceView(),
      ),
    );
  }
}
