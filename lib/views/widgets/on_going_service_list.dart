// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freelancer_app/constant.dart';

class OnGoingServicesList extends StatelessWidget {
  const OnGoingServicesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: .7,
      child: Padding(
        padding:
        const EdgeInsets.symmetric(vertical: 15.0, horizontal: 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset('assets/images/img_bookmark.svg',height: 34,color: kPrimaryColor,),

                // const Icon(
                //   Icons.bookmark_border,
                //   size: 34,
                //   color: kPrimaryColor,
                // ),
                Row(
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'تصليح مكيفات',
                          style: TextStyle(
                              fontWeight: FontWeight.w800, fontSize: 16),
                        ),
                        Text('هشام'),
                      ],
                    ),
                    const SizedBox(
                      width: 16.0,
                    ),
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: kPrimaryColor),
                      child: const Icon(
                        Icons.settings,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            const SizedBox(
              child: Divider(color: Colors.grey, thickness: 3),
            ),
            const SizedBox(height: 12,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.orangeAccent),
                    padding:const  EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 4),
                    child: const Text(
                      'فحص',
                      style: TextStyle(color: Colors.white, fontSize: 16,fontWeight: FontWeight.w600),
                    )),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '12/08/2023',
                      style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 8,),
                    Text('6 مساءً',
                      style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      'طرطوس',
                      style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 4,),
                    const Text('ساعه/9000 ل.س',
                      style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 4,),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: kPrimaryColor,width: 3)
                        ),
                      child: const Text('في الموقع',style: TextStyle(color: kPrimaryColor,fontWeight: FontWeight.w500,fontSize: 16),),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
