import 'package:flutter/material.dart';
import 'package:movies_app/models/cast.dart';
import 'package:movies_app/widgets/cast_container.dart';

class CastList extends StatelessWidget {
  final List<Cast> castList;

  const CastList({super.key, required this.castList});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: castList.length,
        itemBuilder: (BuildContext context, int index) {
          return CastContainer(cast: castList[index]);
        },
      ),
    );
  }
}
