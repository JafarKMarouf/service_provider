import 'package:flutter/material.dart';
import 'package:freelancer_app/views/screens/desc_service_view.dart';
import 'package:freelancer_app/views/widgets/custome_icon_service.dart';

class CustomeServiceItem extends StatelessWidget {
  const CustomeServiceItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const DescServiceView()));
        },
        child: const Column(
          children: [
            Expanded(
              child: CustomeIconService(),
            ),
            Text('تصليح',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    );
  }
}
