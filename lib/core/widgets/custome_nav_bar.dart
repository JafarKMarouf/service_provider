import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:freelancer_app/constant.dart';
import 'package:freelancer_app/core/utils/api_service.dart';
import 'package:freelancer_app/features/booked_services/presentation/view/booked_services_list_view.dart';
import 'package:freelancer_app/features/home/presentation/view/home_view.dart';
import 'package:freelancer_app/features/profile/data/repos/profile_repo_impl.dart';
import 'package:freelancer_app/features/profile/presentation/view/profile_view.dart';
import 'package:freelancer_app/features/profile/presentation/view_models/profile_cubit/profile_cubit.dart';

class CustomeNavBar extends StatefulWidget {
  const CustomeNavBar({super.key});

  @override
  State<CustomeNavBar> createState() => _CustomeNavBarState();
}

class _CustomeNavBarState extends State<CustomeNavBar> {
  List<Widget> screens = const [
    ProfileView(),
    BookedServicesListView(),
    BookedServicesListView(),
    HomeView(),
  ];

  int currentIndex = 3;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(
        ProfileRepoImpl(
          ApiService(
            Dio(),
          ),
        ),
      ),
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          elevation: 0,
          onTap: (value) {
            currentIndex = value;
            setState(
              () {},
            );
          },
          selectedItemColor: kPrimaryColor,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/images/img_lock.svg',
                width: 24,
                height: 30,
                colorFilter: const ColorFilter.mode(
                  kPrimaryColor,
                  BlendMode.srcIn,
                ),
              ),
              label: 'profile',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/images/img_settings.svg',
                width: 24,
                height: 30,
                colorFilter: const ColorFilter.mode(
                  kPrimaryColor,
                  BlendMode.srcIn,
                ),
              ),
              label: 'booked',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/images/img_bookmark_primary.svg',
                width: 24,
                height: 30,
                colorFilter: const ColorFilter.mode(
                  kPrimaryColor,
                  BlendMode.srcIn,
                ),
              ),
              label: 'bookmark',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/images/img_settings_gray_300.svg',
                width: 24,
                height: 30,
                colorFilter: const ColorFilter.mode(
                  kPrimaryColor,
                  BlendMode.srcIn,
                ),
              ),
              label: 'home',
            ),
          ],
        ),
        body: screens[currentIndex],
      ),
    );
  }
}
