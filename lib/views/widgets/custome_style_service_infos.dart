import 'package:flutter/material.dart';
import 'package:freelancer_app/constant.dart';
import 'package:freelancer_app/views/widgets/custome_service_image.dart';
import 'package:freelancer_app/views/widgets/custome_text.dart';

class CustomeStyleServiceInfos extends StatelessWidget {
  const CustomeStyleServiceInfos({
    super.key,
    required this.title,
    this.info,
    this.image1,
    this.image2,
    this.image3,
    this.rating,
  });
  final String title;
  final String? info;
  final String? image1;
  final String? image2;
  final String? image3;
  final bool? rating;
  @override
  Widget build(BuildContext context) {
    if (info != null) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
              child:
                  CustomeText(text: info!, size: 15, weight: FontWeight.w500)),
          CustomeText(text: title, size: 16, weight: FontWeight.w900),
        ],
      );
    } else if (rating == true) {
      return Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        const DisplayStarRating(),
        const SizedBox(
          width: 16,
        ),
        CustomeText(text: title, size: 16, weight: FontWeight.w600),
      ]);
    } else {
      return CustomeServiceImage(
          title: title, image1: image1, image2: image2, image3: image3);
    }
  }
}

class DisplayStarRating extends StatefulWidget {
  const DisplayStarRating({super.key});

  @override
  State<DisplayStarRating> createState() => _DisplayStarRatingState();
}

class _DisplayStarRatingState extends State<DisplayStarRating> {
  int rating = 0;
  @override
  Widget build(BuildContext context) {
    return StarRating(
      onChanged: (index) {
        setState(() {
          rating = index;
        });
      },
      value: rating,
    );
  }
}

class StarRating extends StatelessWidget {
  final void Function(int index) onChanged;
  final int value;
  final IconData? filledStar;
  final IconData? unfilledStar;
  final double size;
  final Color color;
  final int marginFactor;

  const StarRating({
    super.key,
    required this.onChanged,
    this.value = 0,
    this.filledStar,
    this.unfilledStar,
    this.color = kPrimaryColor,
    this.size = 26,
    this.marginFactor = 5,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return RawMaterialButton(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          shape: const CircleBorder(),
          constraints: BoxConstraints.expand(
              width: size - size / marginFactor, height: size),
          padding: EdgeInsets.zero,
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onPressed: () {
            onChanged(value == index + 1 ? index : index + 1);
          },
          child: Icon(
            index < value
                ? filledStar ?? Icons.star
                : unfilledStar ?? Icons.star_border,
            color: color,
            size: size,
          ),
        );
      }),
    );
  }
}
