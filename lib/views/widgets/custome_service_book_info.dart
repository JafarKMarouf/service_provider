import 'package:flutter/material.dart';
import 'package:freelancer_app/constant.dart';

class CustomeServiceBookInfo extends StatefulWidget {
  const CustomeServiceBookInfo({
    super.key,
    required this.text,
    required this.icon,
  });
  final String text;
  final IconData icon;
  @override
  State<CustomeServiceBookInfo> createState() => _CustomeServiceBookInfoState();
}

class _CustomeServiceBookInfoState extends State<CustomeServiceBookInfo> {
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
            horizontal: 24.0,
            vertical: 16.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.text,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  color: tapped ? Colors.white : Colors.black,
                ),
              ),
              const SizedBox(
                width: 4.0,
              ),
              Icon(
                widget.icon,
                color: tapped ? Colors.white : Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomeServiceBookInfoItems extends StatelessWidget {
  const CustomeServiceBookInfoItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 32, bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomeServiceBookInfo(
            text: 'احجز تاريخاً للخدمة',
            icon: Icons.date_range_rounded,
          ),
          Column(
            children: [
              CustomeServiceBookInfo(
                text: 'اختيار الوقت',
                icon: Icons.alarm,
              ),
              SizedBox(
                height: 16,
              ),
              CustomeServiceBookInfo(
                text: 'تحديد الموقع',
                icon: Icons.location_on_outlined,
              )
            ],
          ),
        ],
      ),
    );
  }
}
