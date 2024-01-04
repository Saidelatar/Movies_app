import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/screens/toprated-screen.dart';
import 'package:movies_app/screens/trending_screen.dart';
import 'package:movies_app/widgets/drawer.dart';
import 'package:movies_app/widgets/home_body.dart';
import 'package:movies_app/widgets/nav_bar.dart';
import 'package:movies_app/widgets/custom_text.dart';

class HomeScreen extends StatelessWidget {
  static String id = 'HomeScreen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Container(
          width: double.infinity,
          height: 30.h,
          color: Colors.transparent,
          child: Row(
            children: [
              CustomText(text: 'ClubMovies', size: 18.sp, color: Colors.red),
              SizedBox(
                width: 8.w,
              ),
              CustomText(
                  onTap: () {
                    Navigator.pushNamed(context, TrendingScreen.id);
                  },
                  text: 'Trending',
                  size: 18.sp,
                  color: Colors.white),
              SizedBox(
                width: 8.w,
              ),
              CustomText(
                  onTap: () {
                    Navigator.pushNamed(context, TopRatedScreen.id);
                  },
                  text: 'Top Rated',
                  size: 18.sp,
                  color: Colors.white),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.black,
      body: const HomeBody(),
      bottomNavigationBar: const NavBar(),
    );
  }
}
