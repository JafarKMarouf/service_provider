import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:freelancer_app/core/utils/constant.dart';
import 'package:freelancer_app/core/utils/api_service.dart';
import 'package:freelancer_app/features/booked_services/data/repos/book_service_repo_impl.dart';
import 'package:freelancer_app/features/booked_services/presentation/view/booked_services_list_view.dart';
import 'package:freelancer_app/features/booked_services/presentation/view_models/book_service_cubit/book_service_cubit.dart';
import 'package:freelancer_app/features/home/data/repos/service_repo_impl.dart';
import 'package:freelancer_app/features/home/presentation/view/home_view.dart';
import 'package:freelancer_app/features/home/presentation/view_models/service_cubit/service_cubit.dart';
import 'package:freelancer_app/features/profile/data/repos/profile_repo_impl.dart';
import 'package:freelancer_app/features/profile/presentation/view/profile_view.dart';
import 'package:freelancer_app/features/profile/presentation/view_models/profile_cubit/profile_cubit.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProfileCubit(
            ProfileRepoImpl(
              ApiService(
                Dio(),
              ),
            ),
          ),
        ),
        BlocProvider(
          create: (context) => ServiceCubit(
            ServiceRepoImpl(
              ApiService(
                Dio(),
              ),
            ),
          ),
        ),
        BlocProvider(
          create: (context) => BookServiceCubit(
            BookServiceRepoImpl(
              apiService: ApiService(
                Dio(),
              ),
            ),
          ),
        ),
      ],
      child: Scaffold(
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GNav(
            color: Colors.grey.shade700,
            tabBackgroundColor: kPrimaryColor,
            padding: const EdgeInsets.symmetric(
              vertical: 4,
              horizontal: 8,
            ),
            gap: 20,
            onTabChange: (val) => {
              setState(() {
                currentIndex = val;
              }),
            },
            tabs: const [
              GButton(
                icon: Icons.person,
                text: 'profile',
                iconSize: 32,
                iconActiveColor: Colors.white,
                textColor: Colors.white,
              ),
              GButton(
                icon: Icons.task_alt,
                text: 'booked',
                iconSize: 32,
                iconActiveColor: Colors.white,
                textColor: Colors.white,
              ),
              GButton(
                icon: Icons.bookmarks_outlined,
                text: 'Bookmark',
                iconSize: 32,
                iconActiveColor: Colors.white,
                textColor: Colors.white,
              ),
              GButton(
                icon: Icons.home,
                text: 'Home',
                iconSize: 32,
                iconActiveColor: Colors.white,
                textColor: Colors.white,
              ),
            ],
          ),
        ),
        body: screens[currentIndex],
      ),
    );
  }
}
