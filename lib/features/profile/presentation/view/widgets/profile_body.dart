import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelancer_app/constant.dart';
import 'package:freelancer_app/features/auth/presentation/view/login_view.dart';
import 'package:freelancer_app/features/auth/presentation/view_model/auth_cubit/auth_cubit.dart';
import 'package:freelancer_app/features/profile/data/models/profile_model/customer_info.dart';
import 'package:freelancer_app/features/profile/presentation/view_models/profile_cubit/profile_cubit.dart';
import 'package:get/get.dart' as g;

class ProfileBody extends StatefulWidget {
  const ProfileBody({super.key});

  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  bool loading = true;
  List<CustomerInfo> customerInfo = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is ProfileFailure) {
          loading = false;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errMessage),
              duration: const Duration(
                seconds: 5,
              ),
            ),
          );
        } else if (state is ProfileSuccess) {
          loading = false;
          customerInfo.addAll(
            state.profileModel.customerInfos!.toList(),
          );
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(
            top: 60,
            right: 15,
            left: 15,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  !loading
                      ? Text('${customerInfo[0].customer!.name}')
                      : const Text(''),
                  IconButton(
                    onPressed: () {
                      BlocProvider.of<AuthCubit>(context).logout();
                      Future.delayed(
                        const Duration(seconds: 3),
                        () {
                          g.Get.offAll(
                            () => const LoginView(),
                            transition: g.Transition.fadeIn,
                            duration: kDurationTransition,
                          );
                        },
                      );
                    },
                    icon: const Icon(
                      Icons.exit_to_app,
                      color: kPrimaryColor,
                      size: 32,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
