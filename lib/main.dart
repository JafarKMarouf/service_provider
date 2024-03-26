import 'package:flutter/material.dart';
import 'package:freelancer_app/constant.dart';
import 'package:freelancer_app/views/screens/book_service.dart';
import 'package:freelancer_app/views/screens/login_view.dart';
import 'package:freelancer_app/views/screens/register_view.dart';
import 'package:freelancer_app/views/screens/service_home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          brightness: Brightness.light,
          fontFamily: 'Poppins',
          primaryColorLight: kPrimaryColor),

      // initialRoute: 'home',
      home: BookService(),
      routes: {
        'login': (context) => const LoginView(),
        'register': (context) => const RegisterView(),
        'home': (context) => const ServiceHomeView(),
      },
    );
  }
}
