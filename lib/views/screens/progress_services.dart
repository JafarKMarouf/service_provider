import 'package:flutter/material.dart';
import 'package:freelancer_app/views/widgets/custome_search.dart';
import 'package:freelancer_app/views/widgets/progress_service_item.dart';

class ProgressServices extends StatelessWidget {
  const ProgressServices({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(right: 16, left: 16, top: 60, bottom: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.arrow_back_ios)),
                const CustomeSearch(
                  width: 300,
                ),
              ],
            ),
            const SizedBox(height: 15,),
            const Text(
              'الخدمات المحجوزة',
              style:TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 15,),
            Expanded(
              child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: 12,
                  reverse: true,
                  itemBuilder: (context, index) {
                    return const ProgressServiceItem();
                  }),
            )
          ],
        ),
      ),
    );
  }
}
