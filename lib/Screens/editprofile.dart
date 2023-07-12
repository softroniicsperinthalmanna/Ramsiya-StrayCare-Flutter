import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sc_01/widgets/textfield.dart';

import '../widgets/sizedbox.dart';
import '../widgets/text.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/Android Large - 2.png'),
              fit: BoxFit.cover,
            )),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(15.0.w),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 70.h, bottom: 10.h),
                  child: Image.asset('assets/images/Ellipse 12.png'),
                ),
                text('Edit profile picture', 20.sp, Colors.black,
                    FontWeight.w600),
                sizedbox(50.0.h, .0),
                Align(
                    alignment: Alignment.topLeft,
                    child: text('Name', 20.sp, Colors.black, FontWeight.w600)),
                sizedbox(10.0.h, .0),
                getTextField("", Colors.black, 20.sp, Colors.black, 10.0.w,
                    20.0.h, 10.r),
                sizedbox(30.0, .0),
                Align(
                    alignment: Alignment.topLeft,
                    child: text(
                        'Phone Number', 20.sp, Colors.black, FontWeight.w600)),
                sizedbox(10.0.h, .0),
                getTextField("", Colors.black, 20.sp, Colors.black, 10.0.w,
                    20.0.h, 10.r),
                sizedbox(30.0, .0),
                Align(
                    alignment: Alignment.topLeft,
                    child: text('Email', 20.sp, Colors.black, FontWeight.w600)),
                sizedbox(10.0.h, .0),
                getTextField("", Colors.black, 20.sp, Colors.black, 10.0.w,
                    20.0.h, 10.r),
                sizedbox(30.0, .0),
                Align(
                    alignment: Alignment.topLeft,
                    child:
                    text('Username', 20.sp, Colors.black, FontWeight.w600)),
                sizedbox(10.0.h, .0),
                getTextField("", Colors.black, 20.sp, Colors.black, 10.0.w,
                    20.0.h, 10.r),
                sizedbox(30.0, .0),
                Align(
                    alignment: Alignment.topLeft,
                    child:
                    text('password', 20.sp, Colors.black, FontWeight.w600)),
                sizedbox(10.0.h, .0),
                getTextField("", Colors.black, 20.sp, Colors.black, 10.0.w,
                    20.0.h, 10.r),
                sizedbox(30.0, .0),
                SizedBox(
                  height: 40.h,
                  width: 142.h,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                      backgroundColor: Colors.black,
                    ),
                    onPressed: () {},
                    child: text('submit', 20.sp, Colors.white, FontWeight.w600),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}