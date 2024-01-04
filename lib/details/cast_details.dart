import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/models/cast.dart';
import 'package:movies_app/widgets/custom_text.dart';
import 'package:movies_app/widgets/icon_container.dart';
import 'package:movies_app/widgets/shadow_container.dart';

class CastDetails extends StatelessWidget {
  static String id = 'CastDetails';
  final Cast cast;

  const CastDetails({Key? key, required this.cast}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(cast.profilePath!),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 40,
            left: 20,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back,
                size: 40.sp,
                color: Colors.white,
              ),
            ),
          ),
          ShadowContainer(
            color: Colors.black.withOpacity(0.5),
            height: MediaQuery.of(context).size.height * 0.4,
          ),
          /* Positioned(
            bottom: 0.h,
            left: 0.w,
            right: 0.w,
            child: Container(
              decoration: BoxDecoration(
                //    color:  Colors.red.withOpacity(0.8),// Set the background color of the container
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.8),
                    // Shadow color
                    spreadRadius: 70, // How much the shadow should spread
                    blurRadius: 100, // How blurry the shadow should be
                    offset: Offset(0, 10), // Offset of the shadow
                  ),
                ],
                //  borderRadius: BorderRadius.circular(20), // Optional: Add border radius to the container
              ),
              height: MediaQuery.of(context).size.height * 0.4,
            ),
          ),*/
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
            child: Stack(
              children: [
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.7,
                  bottom: 10.h,
                  right: 16.w,
                  left: 16.w,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: 'Name:${cast.name}',
                          size: 30.sp,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 30.w,
                        ),
                        CustomText(
                          text: 'Character:${cast.character}',
                          size: 15.sp,
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        CustomText(
                          text: 'Popularity:${cast.popularity}',
                          size: 15.sp,
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        const IconContainer(icona: Icons.favorite),
                        SizedBox(
                          height: 20.h,
                        ),
                      ],
                    ),
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
