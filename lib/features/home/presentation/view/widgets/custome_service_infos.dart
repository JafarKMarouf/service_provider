import 'package:flutter/material.dart';

class CustomeServiceInfos extends StatelessWidget {
  const CustomeServiceInfos({
    super.key,
    required this.price,
    required this.description,
  });
  final String price;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                '$price  ل.س ',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
                textDirection: TextDirection.rtl,
              ),
              const Text(
                'رسوم الفحص : ',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
                textDirection: TextDirection.rtl,
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Flexible(
                child: Text(
                  description,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    overflow: TextOverflow.ellipsis,
                  ),
                  maxLines: 2,
                  textDirection: TextDirection.rtl,
                ),
              ),
              const Text(
                'الوصف : ',
                style: TextStyle(
                  fontSize: 18,
                  overflow: TextOverflow.ellipsis,
                  fontWeight: FontWeight.w700,
                ),
                textDirection: TextDirection.rtl,
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }
}
