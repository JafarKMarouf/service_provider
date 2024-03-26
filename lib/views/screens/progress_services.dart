import 'package:flutter/material.dart';
import 'package:freelancer_app/views/widgets/custome_seach.dart';
import 'package:freelancer_app/views/widgets/progress_service_item.dart';

class ProgressServices extends StatelessWidget {
  const ProgressServices({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.only(right: 16, left: 16, top: 60, bottom: 30),
        child: Column(
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
            Expanded(
              child: ListView.builder(
                  padding: const EdgeInsets.only(top: 15),
                  itemCount: 12,
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
