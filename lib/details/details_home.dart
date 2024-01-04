import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movies_app/cubit/add_favorite_movie.dart/add_cubit.dart';
import 'package:movies_app/cubit/add_favorite_movie.dart/movie_states.dart';
import 'package:movies_app/helper/snack_bar.dart';
import 'package:movies_app/models/cast.dart';
import 'package:movies_app/models/movies.dart';
import 'package:movies_app/mylists/my_list_page.dart';
import 'package:movies_app/services/api.dart';
import 'package:movies_app/widgets/cast_list.dart';
import 'package:movies_app/widgets/custom_text.dart';
import 'package:movies_app/widgets/icon_container.dart';
import 'package:movies_app/widgets/shadow_container.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsHome extends StatefulWidget {
  static String id = 'DetailsHome';
  final Movies movie;

  const DetailsHome({Key? key, required this.movie}) : super(key: key);

  @override
  State<DetailsHome> createState() => _DetailsHomeState();
}

class _DetailsHomeState extends State<DetailsHome> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MoviesCubit, MoviesStates>(
      listener: (context, state) {
        if (state is AddMoviesFauilre) {
          print('Error ${state.error}');
        }
        if (state is AddMovieSuccessed) {
          // removed --> uncorrect place BlocProvider.of<AddProductsCubit>(context).AddProducts(product);
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(widget.movie.poster!),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 40,
                left: 20,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back,
                    size: 40.sp,
                    color: Colors.white,
                  ),
                ),
              ),
              ShadowContainer(
                  color: Colors.black.withOpacity(0.7),
                  height: MediaQuery.of(context).size.height * 0.4),
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      top: 40,
                      left: 20,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back,
                          size: 40.sp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 130.h,
                      left: 25.w,
                      right: 25.w,
                      child: GestureDetector(
                          onTap: () async {
                            var url = await Api().getYouTube(widget.movie.id);
                            await launch(url);
                          },
                          child: CircleAvatar(
                            radius: 50,
                            backgroundColor: Colors.red,
                            child: Icon(
                              FontAwesomeIcons.youtube,
                              size: 30.sp,
                            ),
                          )),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.height * 0.4,
                      bottom: 10.h,
                      right: 16.w,
                      left: 16.w,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: widget.movie.title!,
                              size: 30.sp,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 30.w,
                            ),
                            CustomText(
                              text: widget.movie.desc!,
                              size: 15.sp,
                              color: Colors.white,
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            Row(
                              children: [
                                CustomText(
                                  text:
                                      'popularity:e${widget.movie.popularity}',
                                  size: 20.sp,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 50.w,
                                ),
                                GestureDetector(
                                    onTap: () {
                                      BlocProvider.of<MoviesCubit>(context)
                                          .AddMovies(widget.movie);
                                      Navigator.pushNamed(
                                          context, MyListPage.id);
                                      ShowSnackBar(
                                          context, 'Movie added sucessfuly');
                                      setState(() {});
                                    },
                                    child: const IconContainer(
                                        icona: Icons.playlist_add)),
                              ],
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            CustomText(
                                text: 'cast', size: 20.sp, color: Colors.white),
                            SizedBox(
                              height: 10.h,
                            ),
                            FutureBuilder(
                              future: Api().getCastList(widget.movie.id),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  List<Cast> castList = snapshot.data!;
                                  return CastList(castList: castList);
                                } else if (snapshot.hasError) {
                                  return Text('Error: ${snapshot.error}');
                                } else {
                                  return const CircularProgressIndicator();
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}












 
 /*   bottomSheet: BottomSheet(
        backgroundColor: Color.fromARGB(255, 27, 25, 25),
        onClosing: () {},
        builder: (BuildContext context) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.5,
            child: Center(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                      text: movie.title!, size: 22.sp, color: Colors.white),
                  SizedBox(
                    height: 20.h,
                  ),
                  CustomText(
                      text: movie.desc!, size: 15.sp, color: Colors.white),
                  SizedBox(
                    height: 20.h,
                  ),
                  CustomText(
                      text: 'Popularity : ${movie.popularity}',
                      size: 15.sp,
                      color: Colors.white),
                  SizedBox(
                    height: 20.h,
                  ),
                  CustomText(
                      text: 'voets: ${movie.vote}',
                      size: 15.sp,
                      color: Colors.white),
                ],
              ),
            )),
          );
        },
      ),*/