import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sc_01/Screens/User/Find/pet_found.dart';

import '../../../widgets/sizedbox.dart';

class FindPage extends StatefulWidget {
  const FindPage({Key? key}) : super(key: key);

  @override
  State<FindPage> createState() => _FindPageState();
}

class _FindPageState extends State<FindPage> {
  Widget textbutton(swidth, sheight, bgcolor, radius, text, fsize, fw) {
    return SizedBox(
      width: swidth,
      height: sheight,
      child: TextButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => PetFoundPage()));
        },
        style: TextButton.styleFrom(
            backgroundColor: bgcolor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius))),
        child: Text(
          text,
          style: TextStyle(
            color: const Color(0xFFFFFFFF),
            fontSize: fsize,
            fontWeight: fw,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 122.h,
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

      //body with #FFCE56 backgroundColor
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: const Color(0xFFFFCE56),
        child: Padding(
          padding: EdgeInsets.only(bottom: 30.h),
          child: Container(
              height: 622.h,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage(
                  'assets/images/Rectangle 166 2.png',
                ),
                fit: BoxFit.fill,
              )),

              //find button
              child: Padding(
                padding: EdgeInsets.only(
                    top: 400.h, bottom: 120.h, left: 88.w, right: 88.w),
                child: Center(
                  child: textbutton(183.0.w, 50.0.h, const Color(0xFFFFCE56),
                      0.0, 'FIND', 16.sp, FontWeight.w800),
                ),
              )),
        ),
      ),
    );
  }
}
