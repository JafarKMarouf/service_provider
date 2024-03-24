import 'package:flutter/material.dart';
import 'package:freelancer_app/views/widgets/custome_app_bar.dart';
import 'package:freelancer_app/views/widgets/custome_seach.dart';

class ServicesView extends StatelessWidget {
  const ServicesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 60),
      child: Column(
        children: [
          CustomeAppBar(),
          SizedBox(
            height: 15,
          ),
          CustomeSearch()
        ],
      ),
    );
  }
}
