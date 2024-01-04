import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/models/movies.dart';
import 'package:movies_app/widgets/upcoming_card.dart';

class UpComingList extends StatelessWidget {
  final List<Movies> moviesList1;

  const UpComingList({super.key, required this.moviesList1});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170.h,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: moviesList1.length,
        itemBuilder: (BuildContext context, int index) {
          return UpComingCard(
            movie: moviesList1[index],
          );
        },
      ),
    );
  }
}
