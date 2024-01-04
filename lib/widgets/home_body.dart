import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/models/movies.dart';
import 'package:movies_app/services/api.dart';
import 'package:movies_app/widgets/custom_text.dart';
import 'package:movies_app/widgets/popular_list.dart';
import 'package:movies_app/widgets/upcoming_list.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FutureBuilder(
              future: Api().getPopular(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Movies> popularList = snapshot.data!;
                  return PopularList(popularList: popularList);
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return Center(child: Image.asset('assets/images/ripple.gif'));
                }
              },
            ),
            SizedBox(
              height: 10.h,
            ),
            CustomText(text: 'UpComing', size: 18.sp, color: Colors.white),
            SizedBox(
              height: 10.h,
            ),
            FutureBuilder(
              future: Api().getUpComing(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Movies> moviesList1 = snapshot.data!;
                  return UpComingList(moviesList1: moviesList1);
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return Center(child: Image.asset('assets/images/ripple.gif'));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
