import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/cubit/add_favorite_movie.dart/add_cubit.dart';
import 'package:movies_app/cubit/add_favorite_movie.dart/movie_states.dart';
import 'package:movies_app/models/movies.dart';
import 'package:movies_app/mylists/item_card.dart';

class FavoriteList extends StatefulWidget {
  const FavoriteList({super.key});

  @override
  State<FavoriteList> createState() => _CartListViewState();
}

class _CartListViewState extends State<FavoriteList> {
  @override
  Widget build(BuildContext context) {
    List<Movies> models = BlocProvider.of<MoviesCubit>(context).movies;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: BlocConsumer<MoviesCubit, MoviesStates>(
        listener: (context, state) {
          if (state is AddMoviesFauilre) {
            print("Error ${state..error}");
          }
          if (state is AddMovieSuccessed) {
            setState(() {});
          }
        },
        builder: (context, state) {
          return models.isEmpty
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        'Add Movies',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Your List is empty',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ],
                )
              : Expanded(
                  child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: models.length,
                      itemBuilder: (context, index) {
                        return MyListItem(
                          movie: models[index],
                        );
                      }),
                );
        },
      ),
    );
  }
}
