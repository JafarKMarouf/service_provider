import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelancer_app/constant.dart';
import 'package:freelancer_app/features/auth/presentation/view/login_view.dart';
import 'package:freelancer_app/features/auth/presentation/view_model/auth_cubit/auth_cubit.dart';
import 'package:freelancer_app/features/profile/data/models/profile_model/profile_model.dart';
import 'package:freelancer_app/features/profile/presentation/view_models/profile_cubit/profile_cubit.dart';
import 'package:get/get.dart' as g;

import 'widgets/profile_body.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  late ProfileModel profileModel;

  @override
  void initState() {
    BlocProvider.of<ProfileCubit>(context).showProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('${state.userModel.message}'),
              duration: const Duration(
                seconds: 5,
              ),
            ),
          );
          Future.delayed(
            const Duration(milliseconds: 250),
            () {
              g.Get.offAll(
                () => const LoginView(),
                transition: g.Transition.fadeIn,
                duration: kDurationTransition,
              );
            },
          );
        } else if (state is AuthFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage),
              duration: const Duration(
                seconds: 50,
              ),
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            actions: [
              // Text('${BlocProvider.of<ProfileCubit>(context).name}'),
              IconButton(
                onPressed: () {
                  BlocProvider.of<AuthCubit>(context).logout();
                },
                icon: const Icon(
                  Icons.exit_to_app,
                  color: kPrimaryColor,
                  size: 32,
                ),
              ),
            ],
          ),
          body: const ProfileBody(),
        );
      },
    );
  }
}
