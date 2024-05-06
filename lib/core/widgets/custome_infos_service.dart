import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../utils/constant.dart';

class CustomeInfosService extends StatefulWidget {
  const CustomeInfosService({
    super.key,
    required this.text,
    required this.icon,
    this.onPressed,
  });
  final String text;
  final IconData icon;
  final void Function()? onPressed;
  @override
  State<CustomeInfosService> createState() => _CustomeInfosServiceState();
}

class _CustomeInfosServiceState extends State<CustomeInfosService> {
  bool tapped = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        tapped = !tapped;
        setState(
          () {},
        );
      },
      child: Card(
        margin: EdgeInsets.zero,
        elevation: .6,
        color: tapped ? kPrimaryColor : CardTheme.of(context).color,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            AutoSizeText(
              widget.text,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: tapped ? Colors.white : Colors.grey[800],
              ),
              maxLines: 2,
              maxFontSize: 14,
            ),
            IconButton(
              onPressed: widget.onPressed,
              icon: Icon(
                widget.icon,
                color: tapped ? Colors.white : Colors.grey[800],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
