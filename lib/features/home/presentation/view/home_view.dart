import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelancer_app/core/utils/api_service.dart';
import 'package:freelancer_app/features/home/data/repos/service_repo_impl.dart';
import 'package:freelancer_app/features/home/presentation/view_models/service_cubit/service_cubit.dart';

import 'widgets/home_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ServiceCubit(
        ServiceRepoImpl(
          ApiService(
            Dio(),
          ),
        ),
      ),
      child: const Scaffold(
        body: HomeBody(),
      ),
    );
  }
}
