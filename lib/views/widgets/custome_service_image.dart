import 'package:flutter/material.dart';
import 'package:freelancer_app/views/widgets/custome_text.dart';

class CustomeServiceImage extends StatelessWidget {
  const CustomeServiceImage({
    super.key,
    required this.title,
    required this.image1,
    required this.image2,
    required this.image3,
  });

  final String title;
  final String? image1;
  final String? image2;
  final String? image3;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        CustomeText(text: title, size: 18, weight: FontWeight.w700),
        const SizedBox(width: 24,),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          reverse: true,
          child: Row(
            children: [
              Image.asset(
                  image1 ?? '',
                  width: MediaQuery.of(context).size.width*.4,
                  height: MediaQuery.of(context).size.height/5
              ),
              const SizedBox(width: 16,),
              Image.asset(
                  image2 ?? '',
                  width: MediaQuery.of(context).size.width*.4,
                  height: MediaQuery.of(context).size.height/5
              ),
              const SizedBox(width: 16,),
              Image.asset(
                image3 ?? '',
                width: MediaQuery.of(context).size.width*.4,
                height: MediaQuery.of(context).size.height/5,
              ),],
          ),
        ),
      ],
    );
  }
}
