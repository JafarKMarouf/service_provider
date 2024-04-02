import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:freelancer_app/constant.dart';
import 'package:freelancer_app/features/booked_services/presentation/view/booked_services_view.dart';
import 'package:freelancer_app/features/home/presentation/view/home_view.dart';
import 'package:freelancer_app/features/home/presentation/view/settings_view.dart';
import 'package:freelancer_app/features/profile/presentation/view/profile_view.dart';

class CustomeBottomNavBar extends StatefulWidget {
  const CustomeBottomNavBar({super.key});

  @override
  State<CustomeBottomNavBar> createState() => _CustomeBottomNavBarState();
}

class _CustomeBottomNavBarState extends State<CustomeBottomNavBar> {
  List<Widget> screens = const [
    ProfileView(),
    SettingsView(),
    BookedServiceView(),
    HomeView(),
  ];

  int currentIndex = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        elevation: 0,
        onTap: (value) {
          currentIndex = value;
          setState(() {});
        },
        selectedItemColor: kPrimaryColor,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/images/img_lock.svg',
              width: 24,
              height: 30,
              colorFilter:
              const ColorFilter.mode(kPrimaryColor, BlendMode.srcIn),
            ),
            label: 'profile',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/images/img_search.svg',
              width: 24,
              height: 30,
              colorFilter:
              const ColorFilter.mode(kPrimaryColor, BlendMode.srcIn),
            ),
            label: 'settings',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/images/img_settings.svg',
              width: 24,
              height: 30,
              colorFilter:
              const ColorFilter.mode(kPrimaryColor, BlendMode.srcIn),
            ),
            label: 'booked',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/images/img_settings_gray_300.svg',
              width: 24,
              height: 30,
              colorFilter:
              const ColorFilter.mode(kPrimaryColor, BlendMode.srcIn),
            ),
            label: 'home',
          ),
        ],
      ),
      body: screens[currentIndex],
      // bottomNavigationBar: Container(
      //   color: kPrimaryColor,
      //   child: Padding(
      //     padding: const EdgeInsets.all(8.0),
      //     child: GNav(
      //       color: const Color(0xff252525),
      //       activeColor: kPrimaryColor,
      //       selectedIndex: currentIndex,
      //       tabBackgroundColor: Colors.white,
      //       padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),            // gap: 10,
      //       onTabChange: (val) => {
      //         setState(() {
      //           currentIndex = val;
      //         }),
      //       },
      //
      //       tabs:   [
      //         GButton(icon: Icons.person,),
      //         GButton(icon: Icons.settings,),
      //         // SvgAssetLoader('assets/images/img_settings.svg'),
      //         GButton(icon: Icons.bookmark,),
      //         GButton(icon: Icons.home),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
