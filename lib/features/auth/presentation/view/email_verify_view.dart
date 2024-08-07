import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelancer_app/core/constants/app_storage.dart';
import 'package:freelancer_app/core/utils/api_service.dart';
import 'package:freelancer_app/features/auth/data/repos/auth_repo_impl.dart';
import 'package:freelancer_app/features/auth/presentation/view/widgets/email_verify_body.dart';
import 'package:freelancer_app/features/auth/presentation/view_model/auth_cubit/auth_cubit.dart';

class EmailVerifyView extends StatelessWidget {
  const EmailVerifyView({super.key});

  @override
  Widget build(BuildContext context) {
    AppStorage.getEmail();
    return BlocProvider(
      create: (context) {
        final cubit = AuthCubit(AuthRepoImpl(ApiService(Dio())));
        cubit.getEmail();
        return cubit;
      },
      child: const Scaffold(body: EmailVerifyBody()),
    );
  }
}
