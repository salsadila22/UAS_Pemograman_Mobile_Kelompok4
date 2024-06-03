import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MenuWidgets extends StatelessWidget {
  const MenuWidgets({
    super.key,
    required this.name,
    required this.desc,
  });

  final String name;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.w,
      height: 40.h,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(5.w),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(name),
          Text(desc),
        ],
      ),
    );
  }
}
