import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuWidgets extends StatelessWidget {
  const MenuWidgets({
    super.key,
    required this.name,
    this.desc,
    required this.function,
  });

  final String name;
  final String? desc;
  final Function() function;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Container(
        width: 300.w,
        height: 55.h,
        margin: EdgeInsets.only(bottom: 30.h),
        padding: EdgeInsets.symmetric(
          vertical: 5.h,
          horizontal: 10.w,
        ),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(5.w),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.bold,
                fontSize: 15.w,
              ),
            ),
            desc != null ? Text(desc!) : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
