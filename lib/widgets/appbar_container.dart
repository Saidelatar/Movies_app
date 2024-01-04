import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/widgets/custom_text.dart';

class AppBarContainer extends StatelessWidget {
  const AppBarContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(top: 50, right: 15),
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back,
                size: 30.sp,
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: 25.w,
            ),
            CustomText(text: 'ClubMovies', size: 20.sp, color: Colors.red),
          ],
        ),
      ),
    );
  }
}
