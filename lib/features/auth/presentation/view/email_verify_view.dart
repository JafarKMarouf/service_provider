import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelancer_app/core/utils/api_service.dart';
import 'package:freelancer_app/features/auth/data/repos/auth_repo_impl.dart';
import 'package:freelancer_app/features/auth/presentation/view/widgets/email_verify_body.dart';
import 'package:freelancer_app/features/auth/presentation/view_model/auth_cubit/auth_cubit.dart';
import 'package:get/get.dart';

class EmailVerifyView extends StatelessWidget {
  const EmailVerifyView({
    super.key,
    this.email,
  });
  final String? email;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(
        AuthRepoImpl(
          ApiService(
            Dio(),
          ),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
              size: 24,
            ),
          ),
          centerTitle: true,
          title: const Text(
            'تأكيد بواسطة البريد الالكتروني',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            // textDirection: TextDirection.rtl,
          ),
        ),
        body: const EmailVerifyBody(),
      ),
    );
  }
}
