import 'package:flutter/material.dart';
import 'package:movies_app/models/movies.dart';
import 'package:movies_app/services/api.dart';
import 'package:movies_app/widgets/appbar_container.dart';
import 'package:movies_app/widgets/trending_list.dart';

class TrendingScreen extends StatelessWidget {
  static String id = 'trendingscreen';

  const TrendingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const AppBarContainer(),
              FutureBuilder(
                future: Api().getTrending(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<Movies> trendingList = snapshot.data!;
                    return TrendingList(trendingList: trendingList);
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return Image.asset('assets/images/ripple.gif');
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
