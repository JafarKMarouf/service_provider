import 'package:flutter/material.dart';
import 'package:freelancer_app/views/login_view.dart';
import 'package:freelancer_app/views/register_view.dart';

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
        // backgroundColor: Color(0xffF5F5F5),
        // backgroundColor: Color(0xffF5F5F5),
        brightness: Brightness.light,
        fontFamily: 'Poppins'
      ),
      initialRoute: 'login',
      // home: SignInView(),
      routes: {
        'login' : (context) => const LoginView(),
        'register' : (context) => const RegisterView(),
      },
    );
  }
}
