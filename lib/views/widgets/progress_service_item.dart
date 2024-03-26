import 'package:flutter/material.dart';
import 'package:freelancer_app/constant.dart';

class ProgressServiceItem extends StatelessWidget {
  const ProgressServiceItem({super.key});

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
                Icon(
                  Icons.bookmark_border,
                  size: 34,
                  color: kPrimaryColor,
                ),
                Row(
                  children: [
                    Column(
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
                    SizedBox(
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
            SizedBox(
              height: 8,
            ),
            SizedBox(
              child: Divider(color: Colors.grey, thickness: 3),
            ),
            SizedBox(height: 12,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.orangeAccent),
                    padding: EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 4),
                    child: Text(
                      'فحص',
                      style: TextStyle(color: Colors.white, fontSize: 16,fontWeight: FontWeight.w600),
                    )),
                Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
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
                    Text(
                      'طرطوس',
                      style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 4,),
                    Text('ساعه/9000 ل.س',
                      style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 4,),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 4,horizontal: 8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: kPrimaryColor,width: 3)
                        // color: kPrimaryColoraryColor
                      ),
                      child: Text('في الموقع',style: TextStyle(color: kPrimaryColor,fontWeight: FontWeight.w500,fontSize: 16),),
                    ),
                  ],
                ),
              ],
            ),
            // const Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   // crossAxisAlignment: CrossAxisAlignment.end,
            //   children: [
            //     // Text(''),
            //     // Spacer(flex: 1,),
            //     // Expanded(child: child)
            //     Text('6 مساءً'),
            //     Text('ساعه/9000 ل.س'),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
