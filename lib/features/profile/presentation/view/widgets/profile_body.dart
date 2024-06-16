import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelancer_app/core/utils/constant.dart';
import 'package:freelancer_app/core/widgets/custome_service_bar.dart';
import 'package:freelancer_app/features/auth/presentation/view/login_view.dart';
import 'package:freelancer_app/features/auth/presentation/view_model/auth_cubit/auth_cubit.dart';
import 'package:freelancer_app/features/profile/data/models/profile_model/customer_info.dart';
import 'package:freelancer_app/features/profile/presentation/view/widgets/custome_profile_bar.dart';
import 'package:freelancer_app/features/profile/presentation/view_models/profile_cubit/profile_cubit.dart';
import 'package:shimmer/shimmer.dart';
import 'package:get/get.dart' as g;

class ProfileBody extends StatefulWidget {
  const ProfileBody({super.key});

  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  List<CustomerInfo> customerInfo = [];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is ProfileFailure) {
          return Center(child: Text(state.errMessage));
        } else {
          if (state is ProfileSuccess) {
            customerInfo.addAll(state.profileModel.customerInfos!.toList());
          }
          return Padding(
            padding: const EdgeInsets.only(top: 45, right: 15, left: 15),
            child: Column(
              children: [
                (state is ProfileSuccess)
                    ? CustomeProfileBar(
                        title: '${customerInfo[0].customer!.name}',
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
                      )
                    : Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: const Text(''),
                      ),

                // Shimmer.fromColors(
                //     baseColor: Colors.grey[300]!,
                //     highlightColor: Colors.grey[100]!,
                //     child: Center(
                //       child: Container(
                //         width: 50,
                //         height: 50,
                //         decoration: BoxDecoration(
                //           borderRadius: BorderRadius.circular(20),
                //           color: Colors.white,
                //         ),
                //       ),
                //     ),
                //   ),
                // IconButton(
                //   onPressed: () {
                //     BlocProvider.of<AuthCubit>(context).logout();
                //     Future.delayed(
                //       const Duration(seconds: 3),
                //       () {
                //         g.Get.offAll(
                //           () => const LoginView(),
                //           transition: g.Transition.fadeIn,
                //           duration: kDurationTransition,
                //         );
                //       },
                //     );
                //   },
                //   icon: const Icon(
                //     Icons.exit_to_app,
                //     color: kPrimaryColor,
                //     size: 32,
                //   ),
                // )
              ],
            ),
          );
        }
      },
    );
  }
}
