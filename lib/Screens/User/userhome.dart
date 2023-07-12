import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sc_01/Screens/User/Report/report_animal_issue.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Auth/signincatogories.dart';
import '../../SharedpreferenceUse/spUse.dart';
import '../about.dart';
import 'Adopt/adopt.dart';
import 'Donate/donate.dart';
import '../editprofile.dart';
import 'Find/find.dart';
import '../helpline.dart';

class UserHomePage extends StatefulWidget {
  const UserHomePage({Key? key}) : super(key: key);

  @override
  State<UserHomePage> createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  var lid;
  @override
  void initState() {
    super.initState();
    SharedPreferencesHelper.getSavedData().then((value) {
      setState(() {
        lid = value;
      });
    });

    // myLogin();
  }
//
//   Future<void> myLogin() async {
//     lid = await getSavedData();
//     print('LoginID:$lid');
//   }

  Widget getbutton(
      {required String text,
      required String bttntext,
      required String image,
      required Widget navpage}) {
    return Container(
      height: 196.h,
      width: 327.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.r),
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.fill)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 10.h,
          ),
          SizedBox(
            height: 32.h,
            width: 111.w,
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return navpage;
                  }));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFFFFFF),
                ),
                child: Text(
                  bttntext,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                )),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 92.h,
        actions: [
          Padding(
            padding: EdgeInsets.only(
              top: 12.h,
              bottom: 12.h,
              right: 20.h,
            ),
            child: Image.asset(
              'assets/images/Rectangle_28-removebg-preview.png',
              height: 94.h,
              width: 78.w,
            ),
          ),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: const Color(0xFFFFFFFF),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 30.h,
              ),
              getbutton(
                  text: 'REPORTING ANIMAL ISSUES',
                  bttntext: 'REPORT',
                  image: 'assets/images/Rectangle 219.png',
                  navpage: const ReportAnimalIssuePge()),
              SizedBox(
                height: 30.h,
              ),
              getbutton(
                  text: 'FOUND YOUR PET',
                  bttntext: 'FIND',
                  image: 'assets/images/Rectangle 220.png',
                  navpage: const FindPage()),
              SizedBox(
                height: 30.h,
              ),
              getbutton(
                  text: 'ADOPT OR SPONSOR A STRAY ANIMAL',
                  bttntext: 'ADOPT',
                  image: 'assets/images/Rectangle 233.png',
                  navpage: const AdoptPage()),
              SizedBox(
                height: 30.h,
              ),
              getbutton(
                  text: 'HELP US MORE LIVES DONATE TODAY',
                  bttntext: 'DONATE',
                  image: 'assets/images/Rectangle 220 (1).png',
                  navpage: const DonatePage()),
            ],
          ),
        ),
      ),
      drawer: Drawer(
        backgroundColor: const Color(0xFFFFCE56),
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            Padding(
              padding: EdgeInsets.all(70.0.h),
              child: SizedBox(
                  height: 164.h,
                  width: 137.w,
                  child: Image.asset(
                      'assets/images/Rectangle_28-removebg-preview.png')),
            ),
            // ListTile(
            //   leading: const Icon(Icons.person_2),
            //   title: Text("User profile",
            //       style: GoogleFonts.koHo(
            //         textStyle: TextStyle(
            //           fontWeight: FontWeight.w600,
            //           fontSize: 20.sp,
            //         ),
            //       )),
            //   onTap: () {
            //     Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //             builder: (context) => const EditProfilePage()));
            //   },
            // ),
            // ListTile(
            //   leading: const Icon(Icons.notifications_none),
            //   title: Text("Notifications",
            //       style: GoogleFonts.koHo(
            //         textStyle: TextStyle(
            //           fontWeight: FontWeight.w600,
            //           fontSize: 20.sp,
            //         ),
            //       )),
            //   onTap: () {
            //     Navigator.pop(context);
            //   },
            // ),
            ListTile(
              leading: const Icon(Icons.edit),
              title: Text("About us",
                  style: GoogleFonts.koHo(
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20.sp,
                    ),
                  )),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AboutUsPage()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.phone),
              title: Text("Help Line",
                  style: GoogleFonts.koHo(
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20.sp,
                    ),
                  )),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HelpLinePage()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: Text("LogOut",
                  style: GoogleFonts.koHo(
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20.sp,
                    ),
                  )),
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: Text('Do you want to LogOut ?'),
                        actions: [
                          TextButton(
                              onPressed: () {
                                SharedPreferences.getInstance().then((prefs) {
                                  prefs.remove('loginId');
                                });

                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            SigninCatogoriesPage()));
                              },
                              child: Text('Yes')),
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('No')),
                        ],
                      );
                    });
              },
            ),
          ],
        ),
      ),
    );
  }
}
