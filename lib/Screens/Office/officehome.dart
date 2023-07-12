import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sc_01/Screens/Office/deadlist.dart';
import 'package:sc_01/Screens/Office/fosteringlist.dart';
import 'package:sc_01/Screens/Office/stray.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Auth/signincatogories.dart';
import 'adopt.dart';
import 'collectedlist.dart';

class OfficeHomePage extends StatelessWidget {
  const OfficeHomePage({Key? key}) : super(key: key);

  Widget getTextButton({required String text, required VoidCallback callback}) {
    return Padding(
      padding: EdgeInsets.all(15.0.h),
      child: SizedBox(
        height: 65.h,
        width: 243.w,
        child: TextButton(
          onPressed: callback,
          style: TextButton.styleFrom(
              backgroundColor: Color(0XFF922020).withOpacity(0.42),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.r),
              )),
          child: Text(text,
              style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFFFFFFFF))),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage(
            'assets/images/Rectangle 177.png',
          ),
          fit: BoxFit.fill,
        )),
        child: ListView(children: [
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: Text('Do you want to LogOut ?'),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    SharedPreferences.getInstance()
                                        .then((prefs) {
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
                  icon: Icon(
                    Icons.logout,
                    size: MediaQuery.of(context).size.width * 0.1,
                    color: Color(0xFFFFFFFF),
                  ),
                ),
                //menu icon
                SizedBox(
                  width: 146.w,
                ),
                Image.asset(
                  'assets/images/Rectangle_28-removebg-preview.png',
                  height: 136.h,
                  width: 111.w,
                ),
              ],
            ),
          ),

          //catogories
          getTextButton(
              text: 'Stray Report Case',
              callback: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ViewStrayCase()));
              }),
          getTextButton(
              text: 'Collections',
              callback: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Collectedlist()));
              }),
          getTextButton(
              text: 'Fosterings',
              callback: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FosteringList()));
              }),
          getTextButton(
              text: 'Adoptions',
              callback: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Adopt()));
              }),
          getTextButton(
              text: 'No Mores',
              callback: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DeadList()));
              }),
        ]),
      ),
    );
  }
}
