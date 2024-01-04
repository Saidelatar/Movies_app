import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class googleContainer extends StatelessWidget {
  final String url;
  final Function()? onTap;

  const googleContainer({super.key, required this.url, this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Image.asset(url),
        width: 50.w,
        height: 50.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
      ),
    );
  }
}
