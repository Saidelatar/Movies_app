import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:movies_app/helper/snack_bar.dart';
import 'package:movies_app/screens/Home_screen.dart';
import 'package:movies_app/screens/sign_in.dart';
import 'package:movies_app/widgets/custom_text_field.dart';

class Signup extends StatefulWidget {
  static String id = 'Signup';

  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  String? email, password, username;
  bool is_loading = false;
  GlobalKey<FormState> formkey = GlobalKey();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool isPasswordVisible = true;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: is_loading,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            'ClubMovies',
            style: TextStyle(
              color: const Color.fromARGB(255, 250, 11, 11),
              fontWeight: FontWeight.bold,
              fontSize: 25.sp,
            ),
          ),
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
                      controller: _usernameController,
                      onChanged: (data) {
                        username = data;
                      },
                      hint: 'Username'),
                  SizedBox(
                    height: 20.h,
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
                      onChanged: (data) {
                        password = data;
                      },
                      controller: _passwordController,
                      obscureText: isPasswordVisible,
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
                        is_loading = true;
                        setState(() {});

                        try {
                          await signup();
                          ShowSnackBar(context, 'SignUp sucessfuly');
                          Navigator.pushNamed(context, HomeScreen.id);
                          _emailController.clear();
                          _passwordController.clear();
                          _usernameController.clear();
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'weak-password') {
                            ShowSnackBar(context, 'The password is too weak.');
                          } else if (e.code == 'email-already-in-use') {
                            ShowSnackBar(context,
                                'The account already exists for that email.');
                          }
                        } catch (e) {
                          print(e.toString());
                        }
                      }
                      is_loading = false;
                      setState(() {});
                    },
                    child: Container(
                      width: double.infinity,
                      height: 50.h,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white.withOpacity(0.7),
                          width: 2.0.w,
                        ),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black,
                      ),
                      child: Center(
                        child: Text(
                          'Sign UP',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account?',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacementNamed(context, SignIn.id);
                        },
                        child: Text(
                          ' Sign in Now',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
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

  Future<void> signup() async {
    final UserCredential credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }
}
