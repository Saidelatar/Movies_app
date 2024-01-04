import 'package:flutter/material.dart';
import 'package:movies_app/models/movies.dart';
import 'package:movies_app/services/api.dart';
import 'package:movies_app/widgets/appbar_container.dart';
import '../widgets/toprated_list.dart';

class TopRatedScreen extends StatelessWidget {
  static String id = 'TopRatedscreen';

  const TopRatedScreen({super.key});
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
                future: Api().getTopRated(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<Movies> topRatedList = snapshot.data!;
                    return TopRatedList(topRatedList: topRatedList);
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return Center(
                        child: Image.asset('assets/images/ripple.gif'));
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
