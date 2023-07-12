import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sc_01/Auth/sign_in.dart';
import 'package:sc_01/Auth/signincatogories.dart';
import 'package:sc_01/Auth/signup.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFCE56),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //logo image section
              Padding(
                padding:
                    EdgeInsets.only(left: 116.w, bottom: 46.h, right: 123.w),
                child: Image.asset(
                  'assets/images/Rectangle_28-removebg-preview.png',
                  width: 180.w,
                  height: 198.h,
                ),
              ),

              //text section
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 50.w),
                child: Text(
                  'A LIFELINE FOR INDIA’S STRAY ANIMALS',
                  style: TextStyle(
                    fontSize: 30.sp,
                    fontWeight: FontWeight.w800,
                    fontStyle: FontStyle.italic,
                    color: const Color(0xFFFFFFFF),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              //container of sign in section
              Padding(
                padding: EdgeInsets.only(
                  top: 46.h,
                  left: 17.w,
                  bottom: 18.h,
                  right: 17.w,
                ),
                child: Container(
                  width: 326.w,
                  height: 286.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40.r),
                    color: const Color(0xFFF5F5F5),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top: 7.h,
                          bottom: 10.h,
                          left: 136.w,
                          right: 127.w,
                        ),
                        child: Container(
                          width: 61.w,
                          height: 53.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100.r),
                            color: const Color(0xFF1F0C0C),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 60.w),
                        child: Container(
                          height: 35.h,
                          width: 218.w,
                          color: const Color(0xFFFFFFFF),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 7.h, horizontal: 22.w),
                            child: Text(
                              'Welcome  to Stray care',
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 162.w,
                            height: 58.h,
                            color: const Color(0xFFF0B219),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 22.h, horizontal: 57.w),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const SigninCatogoriesPage()));
                                },
                                child: Text(
                                  'SIGN IN',
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          // Container(
                          //   width: 162.w,
                          //   height: 58.h,
                          //   color: const Color(0xFF0F0E0E),
                          //   child: Padding(
                          //     padding: EdgeInsets.symmetric(
                          //         vertical: 22.h, horizontal: 55.w),
                          //     child: GestureDetector(
                          //       onTap: () {
                          //         Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpPage()));
                          //       },
                          //       child: Text(
                          //         'SIGN UP',
                          //         style: TextStyle(
                          //             fontSize: 12.sp,
                          //             fontWeight: FontWeight.w400,
                          //             color: const Color(0xFFFFFFFF)),
                          //       ),
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),

                      //sign in with google or Facebook
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 18.h, horizontal: 83.w),
                        child: Row(
                          children: [
                            SizedBox(
                                width: 26.w,
                                child: const Divider(
                                  color: Color(0xFFD9D9D9),
                                )),
                            SizedBox(
                              width: 10.w,
                            ),
                            const Text('If feeling lazy'),
                            SizedBox(
                              width: 10.w,
                            ),
                            SizedBox(
                              width: 26.w,
                              child: const Divider(
                                color: Color(0xFFD9D9D9),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 83.w,
                          right: 83.w,
                          bottom: 28.h,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/fblogo.png',
                              width: 28.w,
                              height: 28.h,
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Image.asset(
                              'assets/images/Rectangle 7.png',
                              width: 28.w,
                              height: 28.h,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
