import 'package:flutter/material.dart';
import 'package:movies_app/models/movies.dart';
import 'package:movies_app/widgets/popular_card.dart';

class PopularList extends StatelessWidget {
  final List<Movies> popularList;

  const PopularList({super.key, required this.popularList});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: popularList.length,
          itemBuilder: (BuildContext context, int index) {
            return PopularCard(movie: popularList[index]);
          }),
    );
  }
}
