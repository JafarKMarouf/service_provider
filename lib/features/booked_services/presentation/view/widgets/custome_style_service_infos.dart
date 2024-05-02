import 'package:flutter/material.dart';
import 'package:freelancer_app/core/utils/constant.dart';
import 'package:freelancer_app/core/widgets/custome_text.dart';

import 'custome_service_image.dart';

class CustomeStyleServiceInfos extends StatelessWidget {
  const CustomeStyleServiceInfos({
    super.key,
    required this.title,
    this.info,
    this.image1,
    this.image2,
    this.image3,
    this.rating,
    this.clicked = true,
  });
  final String title;
  final String? info;
  final String? image1;
  final String? image2;
  final String? image3;
  final bool? rating;
  final bool clicked;

  @override
  Widget build(BuildContext context) {
    if (info != null) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        // textBaseline: TextBaseline.ideographic,
        children: [
          Expanded(
            child: CustomeText(
              text: info!,
              size: 16,
              weight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          CustomeText(
            text: title,
            size: 16,
            weight: FontWeight.w700,
          ),
        ],
      );
    } else if (rating == true) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          DisplayStarRating(
            clicked: clicked,
          ),
          const SizedBox(
            width: 8,
          ),
          CustomeText(
            text: title,
            size: 16,
            weight: FontWeight.w700,
          ),
        ],
      );
    } else {
      return CustomeServiceImage(
        title: title,
        image1: image1,
        image2: image2,
        image3: image3,
      );
    }
  }
}

class DisplayStarRating extends StatefulWidget {
  const DisplayStarRating({
    super.key,
    this.clicked = true,
  });
  final bool clicked;
  @override
  State<DisplayStarRating> createState() => _DisplayStarRatingState();
}

class _DisplayStarRatingState extends State<DisplayStarRating> {
  int rating = 4;
  @override
  Widget build(BuildContext context) {
    return StarRating(
      clicked: widget.clicked,
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
  final bool clicked;

  const StarRating({
    super.key,
    required this.onChanged,
    this.value = 0,
    this.filledStar,
    this.unfilledStar,
    this.color = kPrimaryColor,
    this.size = 24,
    this.marginFactor = 5,
    this.clicked = true,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        5,
        (index) {
          return RawMaterialButton(
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            shape: const CircleBorder(),
            constraints: BoxConstraints.expand(
              width: size - size / marginFactor,
              height: size,
            ),
            padding: EdgeInsets.zero,
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onPressed: clicked
                ? () {
                    onChanged(
                      value == index + 1 ? index : index + 1,
                    );
                  }
                : () {},
            child: Icon(
              index < value
                  ? filledStar   ?? Icons.star
                  : unfilledStar ?? Icons.star_border,
              color: color,
              size: size,
            ),
          );
        },
      ),
    );
  }
}
