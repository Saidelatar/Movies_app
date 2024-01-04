import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/details/details_home.dart';
import 'package:movies_app/models/movies.dart';

class TrendingCard extends StatelessWidget {
  final Movies movie;

  const TrendingCard({super.key, required this.movie});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailsHome(
                movie: movie,
              ),
            ));
      },
      child: Container(
        width: 150.w,
        child: Image.network(
          movie.poster!,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
