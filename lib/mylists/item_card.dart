import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/cubit/add_favorite_movie.dart/add_cubit.dart';
import 'package:movies_app/models/movies.dart';
import 'package:movies_app/widgets/custom_text.dart';

class MyListItem extends StatelessWidget {
  const MyListItem({
    Key? key,
    required this.movie,
  }) : super(key: key);
  final Movies movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 8, right: 8),
      child: Container(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          height: 150,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.black,
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Expanded(
              child: Row(
                children: [
                  Container(
                    height: 150.h,
                    width: 60.w,
                    child: Image.network(
                      movie.poster!,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  CustomText(text: movie.title!, size: 20, color: Colors.white),
                  SizedBox(
                    height: 10.h,
                  ),
                  IconButton(
                    onPressed: () {
                      try {
                        BlocProvider.of<MoviesCubit>(context)
                            .RemoveProducts(movie);

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Movie removed sucessfuly'),
                          ),
                        );
                      } catch (e) {
                        print(e.toString());
                      }
                    },
                    icon: const Icon(
                      Icons.delete,
                      size: 25,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
