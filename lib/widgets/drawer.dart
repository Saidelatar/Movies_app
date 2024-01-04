import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:movies_app/screens/About_us_screen.dart';
import 'package:movies_app/screens/sign_in.dart';
import 'package:movies_app/widgets/custom_text.dart';

class MyDrawer extends StatelessWidget {
  Function()? onTap;
  Widget? leading;
  Widget? title;

  MyDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.black,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                      text: 'ClubMovies', size: 22.sp, color: Colors.red),
                  CustomText(
                      text: 'Welcome to your club',
                      size: 15.sp,
                      color: Colors.white)
                ],
              )),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('About'),
            onTap: () {
              Navigator.pushNamed(context, AboutScreen.id);
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {
              GoogleSignIn googleSignIn = GoogleSignIn();
              googleSignIn.disconnect();
              Navigator.pushNamed(context, SignIn.id);
            },
          ),
        ],
      ),
    );
  }
}
