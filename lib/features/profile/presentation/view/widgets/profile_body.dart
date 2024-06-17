import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelancer_app/core/utils/constant.dart';
import 'package:freelancer_app/features/auth/presentation/view/login_view.dart';
import 'package:freelancer_app/features/auth/presentation/view_model/auth_cubit/auth_cubit.dart';
import 'package:freelancer_app/features/profile/data/models/profile_model/customer_info.dart';
import 'package:freelancer_app/features/profile/presentation/view/widgets/custome_profile_bar.dart';
import 'package:freelancer_app/features/profile/presentation/view/widgets/profile_success_view.dart';
import 'package:freelancer_app/features/profile/presentation/view_models/profile_cubit/profile_cubit.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    final List<CustomerInfo> customerInfo = [];

    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is ProfileFailure) {
          return Center(child: Text(state.errMessage));
        } else {
          if (state is ProfileSuccess) {
            customerInfo.addAll(state.profileModel.customerInfos!.toList());
          }
          return Padding(
            padding: const EdgeInsets.only(top: 45, right: 16, left: 16),
            child: Column(
              children: [
                (state is ProfileSuccess)
                    ? ProfileSuccessView(customerInfo: customerInfo)
                    : const CustomeProfileBar(
                        isLoading: true,
                      ),
              ],
            ),
          );
        }
      },
    );
  }
}
