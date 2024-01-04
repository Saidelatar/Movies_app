import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movies_app/screens/get_started_screen.dart';
import 'package:movies_app/screens/onbraoad_screen/onbroad.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  List<Tween<double>>? _tweenList;
  List<Animation<double>>? _animationList;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _tweenList = List<Tween<double>>.generate('Club Movies TV'.length, (index) {
      return Tween<double>(begin: 0, end: 1);
    });

    _animationList = _tweenList!
        .map((tween) => tween.animate(_animationController!))
        .toList();

    _animationController!.forward();

    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, GetStarted.id);
    });
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: _animationController!,
          builder: (context, child) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (var i = 0; i < 'Club Movies TV'.length; i++)
                  Opacity(
                    opacity: _animationList![i].value,
                    child: Text(
                      'Club Movies TV'[i],
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 25.sp,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Agbalumo",
                      ),
                    ),
                  ),
                SizedBox(width: 10.h),
                const Icon(
                  FontAwesomeIcons.photoFilm,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
