import 'package:flutter/cupertino.dart';
import 'package:movies_app/models/movies.dart';
import 'package:movies_app/widgets/toprated_card.dart';

class TopRatedList extends StatelessWidget {
  final List<Movies> topRatedList;

  const TopRatedList({super.key, required this.topRatedList});
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
        itemCount: topRatedList.length,
        itemBuilder: (context, index) {
          return TopRatedCard(movie: topRatedList[index]);
        },
      ),
    );
  }
}
