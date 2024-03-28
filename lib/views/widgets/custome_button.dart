import 'package:flutter/material.dart';
import 'package:freelancer_app/constant.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    this.onTap,
    this.color = kPrimaryColor
  });
  final String title;
  final VoidCallback ? onTap;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: MediaQuery.of(context).size.width,
      color: color,
      padding: const EdgeInsets.symmetric(vertical: 12),
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(24),
        borderSide: BorderSide.none
      ),
      elevation: .6,
      onPressed: onTap,
        child: Text(
          title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color:Colors.white,
              ),
              textAlign: TextAlign.center,
        ),
    );
    // return GestureDetector(
    //   onTap: onTap,
    //   child: (
    //     padding: const EdgeInsets.symmetric(vertical: 5),
    //     decoration: BoxDecoration(
    //       color: const Color(0xff36789D),
    //       boxShadow: const[
    //         BoxShadow(
    //             offset: Offset(2, 4),
    //           color: Colors.black45
    //         ),
    //       ],
    //     ),
    //     child: Text(
    //       title,
    //       style: const TextStyle(
    //         fontSize: 25,
    //         color:Colors.white,
    //       ),
    //       textAlign: TextAlign.center,
    //     ),
    //   ),
    // );
  }
}
