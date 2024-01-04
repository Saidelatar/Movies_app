import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShadowContainer extends StatelessWidget {
  final Color color;
  final double height;
  Gradient? gradient;

  ShadowContainer(
      {super.key, required this.color, required this.height, this.gradient});
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0.h,
      left: 0.w,
      right: 0.w,
      child: Container(
        decoration: BoxDecoration(
          gradient: gradient,
          boxShadow: [
            BoxShadow(
              color: color, // Shadow color
              spreadRadius: 70, // How much the shadow should spread
              blurRadius: 120, // How blurry the shadow should be
              offset: const Offset(0, 10), // Offset of the shadow
            ),
          ],
          //  borderRadius: BorderRadius.circular(20), // Optional: Add border radius to the container
        ),
        height: height,
      ),
    );
  }
}
