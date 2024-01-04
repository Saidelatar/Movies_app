import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/Search/search_screen.dart';
import 'package:movies_app/cubit/add_favorite_movie.dart/add_cubit.dart';
import 'package:movies_app/firebase_options.dart';
import 'package:movies_app/mylists/my_list_page.dart';
import 'package:movies_app/screens/About_us_screen.dart';
import 'package:movies_app/screens/Home_screen.dart';
import 'package:movies_app/screens/onbraoad_screen/onbroad.dart';
import 'package:movies_app/screens/toprated-screen.dart';
import 'package:movies_app/screens/sign_in.dart';
import 'package:movies_app/screens/sign_up.dart';
import 'package:movies_app/screens/splash_screen.dart';
import 'package:movies_app/screens/get_started_screen.dart';
import 'package:movies_app/screens/trending_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MoviesApp());
}

class MoviesApp extends StatelessWidget {
  const MoviesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (BuildContext context, child) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => MoviesCubit()),
            ],
            child: MaterialApp(
              routes: {
                GetStarted.id: (context) => const GetStarted(),
                SignIn.id: (context) => const SignIn(),
                Signup.id: (context) => const Signup(),
                HomeScreen.id: (context) => const HomeScreen(),
                TopRatedScreen.id: (context) => const TopRatedScreen(),
                TrendingScreen.id: (context) => const TrendingScreen(),
                SearchScreen.id: (context) => const SearchScreen(),
                AboutScreen.id: (context) => AboutScreen(),
                MyListPage.id: (context) => MyListPage(),
                Onbording.id: (context) => Onbording(),
              },
              debugShowCheckedModeBanner: false,
              theme: ThemeData.dark(),
              home: const SplashScreen(),
            ),
          );
        });
  }
}
