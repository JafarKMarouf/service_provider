import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelancer_app/features/main/presentation/view/home/widget/custome_home_bar.dart';
import 'package:freelancer_app/features/profile/data/models/profile_model/customer_infos.dart';
import 'package:freelancer_app/features/profile/presentation/view_models/profile_cubit/profile_cubit.dart';

class HandleUserDetails extends StatelessWidget {
  const HandleUserDetails({super.key});

  @override
  Widget build(BuildContext context) {
    List<CustomerInfos> customerInfo = [];
    BlocProvider.of<ProfileCubit>(context).showProfile();

    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is ProfileSuccess) {
          customerInfo.addAll(state.profileModel!.customerInfos!.toList());
          return CustomeHomeBar(customerInfos: customerInfo[0]);
        }
        return const CustomeHomeBar(loading: true);
      },
    );
  }
}
