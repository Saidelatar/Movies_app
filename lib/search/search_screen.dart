import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/models/movies.dart';
import 'package:movies_app/search/search_list.dart';
import 'package:movies_app/services/api.dart';
import 'package:movies_app/widgets/custom_text.dart';
import 'package:movies_app/widgets/custom_text_field.dart';

class SearchScreen extends StatefulWidget {
  static String id = 'searchScreen';

  const SearchScreen({super.key});
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String query = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: CustomText(
              text: 'Movies Search', size: 20.sp, color: Colors.red)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomTextField(
              hint: 'Enter a Movie name',
              onChanged: (value) async {
                setState(() {
                  query = value;
                });
              },
            ),
            /*  TextField(
                decoration: InputDecoration(
                  hintText: 'Enter a movie name',
                  suffixIcon: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {},
                  ),
                ),
                onChanged: (value) async {
                  setState(() {
                    query = value;
                  });
                }),*/
            SizedBox(height: 16.h),
            FutureBuilder(
              future: Api().getSearch(query),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Movies> searchList = snapshot.data!;
                  return SearchList(searchList: searchList);
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return Center(child: Image.asset('assets/images/ripple.gif'));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
