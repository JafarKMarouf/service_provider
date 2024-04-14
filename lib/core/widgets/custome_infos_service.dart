import 'package:flutter/material.dart';

import '../utils/constant.dart';

class CustomeInfosService extends StatefulWidget {
  const CustomeInfosService({
    super.key,
    required this.text,
    required this.icon,
  });
  final String text;
  final IconData icon;
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
        elevation: .5,
        color: tapped ? kPrimaryColor : CardTheme.of(context).color,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 12.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.text,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                  color: tapped ? Colors.white : Colors.grey[800],
                ),
              ),
              const SizedBox(
                width: 2.0,
              ),
              Icon(
                widget.icon,
                color: tapped ? Colors.white :Colors.grey[800],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
