import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class GuideMenuWidget extends StatelessWidget {
  const GuideMenuWidget({
    super.key,
    required this.name,
    required this.function,
  });

  final String name;
  final Function() function;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Container(
        height: 90.h,
        width: 320.w,
        padding: EdgeInsets.all(10.w),
        margin: EdgeInsets.only(
          bottom: 20.h,
        ),
        decoration: BoxDecoration(
          color: Colors.grey[700],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w600,
                    fontSize: 15.w,
                    color: Colors.white,
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return const Icon(Icons.star);
                    },
                  ),
                ),
              ],
            ),
            Container(
              width: 80.h,
              height: 80.h,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 5,
                    spreadRadius: 2.w,
                  ),
                ],
                color: Colors.white,
              ),
              child: Center(
                child: Icon(
                  Icons.person,
                  color: Colors.black,
                  size: 50.w,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
