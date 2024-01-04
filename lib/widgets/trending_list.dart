import 'package:flutter/cupertino.dart';
import 'package:movies_app/models/movies.dart';
import 'package:movies_app/widgets/trending_card.dart';

class TrendingList extends StatelessWidget {
  final List<Movies> trendingList;

  const TrendingList({super.key, required this.trendingList});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        clipBehavior: Clip.none,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.693,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
        ),
        itemCount: trendingList.length,
        itemBuilder: (context, index) {
          return TrendingCard(movie: trendingList[index]);
        },
      ),
    );
  }
}
