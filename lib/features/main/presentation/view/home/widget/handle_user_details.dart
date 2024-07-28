import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelancer_app/features/main/presentation/view/home/widget/custome_home_bar.dart';
import 'package:freelancer_app/features/profile/data/models/profile_model/customer_datum.dart';
import 'package:freelancer_app/features/profile/presentation/view_models/profile_cubit/profile_cubit.dart';

class HandleUserDetails extends StatelessWidget {
  const HandleUserDetails({super.key});

  @override
  Widget build(BuildContext context) {
    List<CustomerInfos> customerInfos = [];
    BlocProvider.of<ProfileCubit>(context).showProfile();

    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is ProfileSuccess) {
          customerInfos.addAll(state.profileModel!.customerInfos!.toList());
          BlocProvider.of<ProfileCubit>(context).customerId =
              customerInfos[0].id;

          return CustomeHomeBar(customerInfos: customerInfos[0]);
        }
        return const CustomeHomeBar(loading: true);
      },
    );
  }
}
