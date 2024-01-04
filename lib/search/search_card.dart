import 'package:flutter/material.dart';
import 'package:movies_app/details/details_home.dart';

import 'package:movies_app/models/movies.dart';

class SearchCard extends StatelessWidget {
  final Movies movie;

  const SearchCard({super.key, required this.movie});

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
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          leading: Image.network(
            movie.poster!,
          ),
          title: Text(movie.title!),
        ),
      ),
    );
  }
}
