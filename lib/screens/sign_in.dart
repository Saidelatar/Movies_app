import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:movies_app/helper/snack_bar.dart';
import 'package:movies_app/screens/Home_screen.dart';
import 'package:movies_app/screens/sign_up.dart';
import 'package:movies_app/widgets/custom_text.dart';
import 'package:movies_app/widgets/custom_text_field.dart';
import 'package:movies_app/widgets/sign_google_face_container.dart';

class SignIn extends StatefulWidget {
  static String id = 'Signin';

  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String? email, password;
  GlobalKey<FormState> formkey = GlobalKey();
  bool isLoading = false;
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  bool isPasswordVisible = true;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      color: Colors.red,
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(context, SignIn.id);
              },
              child: Icon(Icons.arrow_back)),
          title: CustomText(
              text: 'ClubMovies',
              size: 25.sp,
              color: const Color.fromARGB(255, 250, 11, 11)),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Form(
            key: formkey,
            child: ListView(children: [
              Column(
                children: [
                  SizedBox(
                    height: 120.h,
                  ),
                  CustomTextField(
                      controller: _emailController,
                      onChanged: (data) {
                        email = data;
                      },
                      hint: 'Email'),
                  SizedBox(
                    height: 20.h,
                  ),
                  CustomTextField(
                      obscureText: isPasswordVisible,
                      onChanged: (data) {
                        password = data;
                      },
                      controller: _passwordController,
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            isPasswordVisible = false;
                          });
                        },
                        child: isPasswordVisible
                            ? const Icon(
                                Icons.visibility,
                                size: 20,
                              )
                            : GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isPasswordVisible = true;
                                  });
                                },
                                child: const Icon(
                                  Icons.visibility_off,
                                  size: 20,
                                ),
                              ),
                      ),
                      hint: 'Password'),
                  SizedBox(
                    height: 30.h,
                  ),
                  GestureDetector(
                    onTap: () async {
                      if (formkey.currentState!.validate()) {
                        isLoading = true;
                        setState(() {});
                        try {
                          await signin();
                          _emailController.clear();
                          _passwordController.clear();
                          ShowSnackBar(context, 'Signin sucessfuly');
                          Navigator.pushNamed(context, HomeScreen.id);
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'user-not-found') {
                            ShowSnackBar(context, 'User Not foound');
                          } else if (e.code == 'wrong-password') {
                            ShowSnackBar(context, 'Wrong password.');
                          } else {
                            ShowSnackBar(context,
                                'An ,error has Eccoured ,check email or password');
                          }
                        } catch (e) {
                          print(e.toString());
                        }
                      }
                      isLoading = false;
                      setState(() {});
                    },
                    child: Container(
                      width: double.infinity,
                      height: 50.h,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white.withOpacity(0.7),
                          width: 2.0.h,
                        ),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black,
                      ),
                      child: Center(
                          child: CustomText(
                              text: 'Sign in',
                              size: 25.sp,
                              color: Colors.white)),
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Center(
                      child: CustomText(
                          text: 'Forgot Password?',
                          size: 18.sp,
                          color: Colors.white)),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                          text: 'New to Club?',
                          size: 18.sp,
                          color: Colors.white),
                      GestureDetector(
                          onTap: () {
                            Navigator.pushReplacementNamed(context, Signup.id);
                          },
                          child: CustomText(
                              text: 'Sign Up Now',
                              size: 18.sp,
                              color: Colors.white)),
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      googleContainer(
                          onTap: () async {
                            await signInWithGoogle();
                          },
                          url: 'assets/images/google_logo.png'),
                      SizedBox(
                        width: 20.w,
                      ),
                      googleContainer(
                        onTap: () async {},
                        url: 'assets/images/fac.png',
                      )
                    ],
                  ),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }

  Future<void> signin() async {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }

  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
      ShowSnackBar(context, 'Successfully signed in with Google.');
      Navigator.pushNamed(context, HomeScreen.id);
    } catch (e) {
      print('Error signing in with Google: $e');
    }
  }
}
