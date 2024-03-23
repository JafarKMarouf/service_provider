import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.title, this.onTap});
  final String title;
  final VoidCallback ? onTap;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: MediaQuery.of(context).size.width,
      color: const Color(0xff36789D),
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 8),
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: BorderSide.none
      ),
      elevation: 1,
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
