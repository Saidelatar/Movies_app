import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/screens/onbraoad_screen/onbroad.dart';
import 'package:movies_app/screens/sign_in.dart';
import 'package:movies_app/widgets/custom_text.dart';
import 'package:movies_app/widgets/shadow_container.dart';

class GetStarted extends StatelessWidget {
  static String id = 'Splash2';

  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/329633.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          ShadowContainer(
            color: const Color.fromARGB(255, 10, 40, 65).withOpacity(0.4),
            height: MediaQuery.of(context).size.height * 0.6,
            gradient: LinearGradient(colors: [
              const Color.fromARGB(255, 10, 40, 65).withOpacity(0.4),
              Colors.red.withOpacity(0.8),
            ], begin: Alignment.topCenter, end: Alignment.bottomLeft),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
            child: Stack(
              children: [
                Positioned(
                  bottom: 50.h,
                  left: 16.w,
                  right: 16.w,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, Onbording.id);
                    },
                    child: Container(
                      width: double.infinity,
                      height: 50.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color.fromARGB(255, 250, 11, 11),
                      ),
                      child: Center(
                          child: CustomText(
                              text: 'Get Started',
                              size: 20.sp,
                              color: Colors.white)),
                    ),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.4,
                  bottom: 150.h,
                  right: 16.w,
                  left: 16.w,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        CustomText(
                          text: 'Unlimited',
                          size: 40.sp,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        CustomText(
                          text: 'Movies, Tv',
                          size: 40.sp,
                          color: Colors.white,
                        ),
                        CustomText(
                          text: 'Shows & More',
                          size: 40.sp,
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 22),
                            child: CustomText(
                                text: 'Watch anywhere. Cancel anytime',
                                size: 30.sp,
                                color: Colors.grey)),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 30.h,
                  right: 10.w,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 30.w,
                      ),
                      CustomText(
                          text: 'PRIVACY', size: 22.sp, color: Colors.white),
                      SizedBox(
                        width: 20.w,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, SignIn.id);
                        },
                        child: CustomText(
                            text: 'LOG IN', size: 22.sp, color: Colors.white),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
