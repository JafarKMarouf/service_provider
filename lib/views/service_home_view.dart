import 'package:flutter/material.dart';
import 'package:freelancer_app/constant.dart';
import 'package:freelancer_app/views/last_service.dart';
import 'package:freelancer_app/views/profile_view.dart';
import 'package:freelancer_app/views/services_view.dart';
import 'package:freelancer_app/views/settings.dart';
import 'package:freelancer_app/views/bookmark_view.dart';
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
    BookmarkView(),
    LastServiceView(),
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
            backgroundColor: kPrimaryColor,
            color: const Color(0xff252525),
            activeColor: kPrimaryColor,
            tabBackgroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            
            // gap: 10,
            onTabChange: (val) => {
              setState(() {
                currentIndex = val;
              }),
            },
            tabs: const [
              GButton(
                icon: Icons.person,
                // text: 'Home',
              ),
              GButton(
                icon: Icons.settings,
                // text: 'Posts',
              ),
              GButton(
                icon: Icons.bookmark,
                // text: 'Person',
              ),
              GButton(icon: Icons.credit_score_sharp),
              GButton(icon: Icons.home),
            ],
          ),
        ),
      ),
      body: screens[currentIndex],
    );
  }
}
