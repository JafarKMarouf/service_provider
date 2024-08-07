import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelancer_app/features/auth/presentation/view_model/auth_cubit/auth_cubit.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'widgets/login_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<AuthCubit>(context);

    return Scaffold(
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthLoading) {
            cubit.loadingLogin = true;
          } else if (state is AuthFailure) {
            cubit.loadingLogin = false;
            Get.snackbar('failed', state.errorMessage);
          } else if (state is AuthSuccess) {
            cubit.loadingLogin = false;
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall: cubit.loadingLogin,
            child: const LoginBody(),
          );
        },
      ),
    );
  }
}
