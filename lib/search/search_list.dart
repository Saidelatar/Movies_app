import 'package:flutter/material.dart';

import 'package:movies_app/models/movies.dart';
import 'package:movies_app/search/search_card.dart';

class SearchList extends StatelessWidget {
  final List<Movies> searchList; // Replace 'Movie' with your actual data model

  const SearchList({Key? key, required this.searchList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: searchList.length,
        itemBuilder: (context, index) {
          return SearchCard(movie: searchList[index]);
        },
      ),
    );
  }
}
