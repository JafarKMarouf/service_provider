import 'package:flutter/material.dart';
import 'widgets/on_going_list.dart';

class OnGoingServicesView extends StatelessWidget {
  const OnGoingServicesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(right: 16, left: 16, top: 60, bottom: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // const CustomeAppBar(),
            const SizedBox(height: 15,),
            const Text(
              'الخدمات الجارية',
              style:TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 15,),
            Expanded(
              child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: 12,
                  reverse: true,
                  itemBuilder: (context, index) {
                    return const OnGoingList();
                  }),
            )
          ],
        ),
      ),
    );
  }
}

