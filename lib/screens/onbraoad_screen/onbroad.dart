import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/models/onbroad.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_app/screens/sign_in.dart';
import 'package:movies_app/widgets/shadow_container.dart';

class Onbording extends StatefulWidget {
  static String id = 'onboarding';
  @override
  _OnbordingState createState() => _OnbordingState();
}

class _OnbordingState extends State<Onbording> {
  int currentIndex = 0;
  PageController? _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.5),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
          tileMode: TileMode.values[3],
          colors: [
            Color.fromARGB(255, 18, 3, 83).withOpacity(0.4),
            Colors.red.withOpacity(0.4),
          ],
          begin: Alignment.topCenter,
          end: Alignment.centerRight,
        )),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: contents.length,
                onPageChanged: (int index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemBuilder: (_, i) {
                  return Padding(
                    padding: const EdgeInsets.all(40),
                    child: Column(
                      children: [
                        Container(
                          child: SvgPicture.asset(
                            contents[i].image,
                            height: 300.h,
                          ),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        Text(
                          contents[i].title,
                          style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Agbalumo'),
                        ),
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.2,
                        ),
                        Container(
                          height: 10.h,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              contents.length,
                              (index) => Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: buildDot(index, context),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        GestureDetector(
                          onTap: () {
                            if (currentIndex == contents.length - 1) {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => SignIn(),
                                ),
                              );
                            }
                            _controller!.nextPage(
                              duration: Duration(milliseconds: 100),
                              curve: Curves.bounceIn,
                            );
                          },
                          child: Container(
                            width: double.infinity,
                            height: 40.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: const Color.fromARGB(255, 250, 11, 11),
                            ),
                            child: Center(
                                child: Text(
                              currentIndex == contents.length - 1
                                  ? 'continue'
                                  : 'Next',
                              style: TextStyle(fontSize: 18.sp),
                            )),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            /*   Container(
              height: 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  contents.length,
                  (index) => Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: buildDot(index, context),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                if (currentIndex == contents.length - 1) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => SignIn(),
                    ),
                  );
                }
                _controller!.nextPage(
                  duration: Duration(milliseconds: 100),
                  curve: Curves.bounceIn,
                );
              },
              child: Container(
                width: double.infinity,
                height: 50.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(11),
                  color: const Color.fromARGB(255, 250, 11, 11),
                ),
                child: Center(
                    child: Text(
                  currentIndex == contents.length - 1 ? 'continue' : 'Next',
                )),
              ),
            ),
             Container(
              height: 60,
              margin: EdgeInsets.all(40),
              width: double.infinity,
              child: ElevatedButton(
                child: Text(
                    currentIndex == contents.length - 1 ? "Continue" : "Next"),
                onPressed: () {
                  if (currentIndex == contents.length - 1) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => SignIn(),
                      ),
                    );
                  }
                  _controller!.nextPage(
                    duration: Duration(milliseconds: 100),
                    curve: Curves.bounceIn,
                  );
                },
              ),
            )*/
          ],
        ),
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 30,
      width: currentIndex == index ? 15 : 10,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: currentIndex == index ? Colors.red : Colors.grey[700],
      ),
    );
  }
}
