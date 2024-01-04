import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IconContainer extends StatelessWidget {
  final IconData icona;

  const IconContainer({super.key, required this.icona});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(
          width: 3.w,
          color: const Color.fromARGB(255, 96, 173, 236),
        ),
        borderRadius: BorderRadius.circular(80),
      ),
      child: Icon(icona),
    );
  }
}
