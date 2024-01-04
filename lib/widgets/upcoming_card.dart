import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/details/details_home.dart';
import 'package:movies_app/models/movies.dart';

class UpComingCard extends StatelessWidget {
  final Movies movie;

  const UpComingCard({super.key, required this.movie});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: GestureDetector(
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
      ),
    );
  }
}
