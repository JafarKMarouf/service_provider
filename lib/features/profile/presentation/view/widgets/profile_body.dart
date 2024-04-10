import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelancer_app/constant.dart';
import 'package:freelancer_app/core/utils/api_service.dart';
import 'package:freelancer_app/features/profile/data/models/profile_model/customer_info.dart';
import 'package:freelancer_app/features/profile/data/models/profile_model/profile_model.dart';
import 'package:freelancer_app/features/profile/presentation/view_models/profile_cubit/profile_cubit.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class ProfileBody extends StatefulWidget {
  const ProfileBody({super.key});

  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  bool loading = false;
  List<CustomerInfo> customerInfo = [];
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: loading,
      child: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {
          if (state is ProfileLoading) {
            loading = true;
          } else if (state is ProfileFailure) {
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
            customerInfo.addAll(state.profileModel.customerInfos!.toList());
            // print(state.profileModel);
          }
        },
        builder: (context, state) {
          return BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 60.0,
                  horizontal: 15,
                ),
                child: Column(
                  children: [
                    !loading
                        ? Text('${customerInfo[0].customer!.name}')
                        : const Text(''),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
