import 'package:flutter/material.dart';
import 'package:freelancer_app/constant.dart';
import 'package:freelancer_app/views/screens/profile_view.dart';
import 'package:freelancer_app/views/screens/progress_services.dart';
import 'package:freelancer_app/views/screens/services_view.dart';
import 'package:freelancer_app/views/screens/settings.dart';
import 'package:freelancer_app/views/screens/bookmark_view.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class ServiceHomeView extends StatefulWidget {
  const ServiceHomeView({super.key});

  @override
  State<ServiceHomeView> createState() => _ServiceHomeViewState();
}

class _ServiceHomeViewState extends State<ServiceHomeView> {

  List<Widget> screens = const [
    ProfileView(),
    SettingsView(),
    ProgressServices(),
    BookmarkView(),
    ServicesView(),
  ];

  int currentIndex = 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: kPrimaryColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GNav(
            color: const Color(0xff252525),
            activeColor: kPrimaryColor,
            selectedIndex: currentIndex,
            tabBackgroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),            // gap: 10,
            onTabChange: (val) => {
              setState(() {
                currentIndex = val;
              }),
            },
            tabs: const [
              GButton(icon: Icons.person,),
              GButton(icon: Icons.settings,),
              GButton(icon: Icons.credit_score_sharp),
              GButton(icon: Icons.bookmark,),
              GButton(icon: Icons.home),
            ],
          ),
        ),
      ),
      body: screens[currentIndex],
    );
  }
}
