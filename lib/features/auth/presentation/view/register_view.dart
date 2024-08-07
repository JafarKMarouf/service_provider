import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelancer_app/core/utils/constant.dart';
import 'package:freelancer_app/features/auth/presentation/view/email_verify_view.dart';
import 'package:freelancer_app/features/auth/presentation/view_model/auth_cubit/auth_cubit.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'widgets/register_body.dart';
import 'package:get/get.dart' as g;

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<AuthCubit>(context);

    return Scaffold(
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthLoading) {
            cubit.loadingRegister = true;
          } else if (state is AuthFailure) {
            cubit.loadingRegister = false;
            g.Get.snackbar('failed', state.errorMessage);
          } else if (state is AuthSuccess) {
            cubit.loadingRegister = false;
            g.Get.snackbar('success', '${state.userModel.message}');
            Future.delayed(
              const Duration(microseconds: 250),
              () {
                g.Get.offAll(
                  () => const EmailVerifyView(),
                  transition: g.Transition.fadeIn,
                  duration: kDurationTransition,
                  arguments: state.userModel.data!.user!.email,
                );
              },
            );
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall: cubit.loadingRegister,
            child: const RegisterBody(),
          );
        },
      ),
    );
  }
}
