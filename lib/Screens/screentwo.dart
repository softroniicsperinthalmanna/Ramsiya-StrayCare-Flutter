import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenTwo extends StatelessWidget {
  const ScreenTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: const Color(0xFFFFCE56),
          child: Center(
            child: Image.asset('assets/images/Rectangle_28-removebg-preview.png',
              width: 130.w, height: 158.h,),
          ),
        ),
      ),
    );
  }
}