import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OtpVerifiedPage extends StatelessWidget {
  const OtpVerifiedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Color(0xFFFFCE56),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipOval(
                child: Container(
                  height: 114.h,
                  width: 114.h,
                  color: Color(0xFF140101),
                  child: Image.asset('assets/images/Vector.png',width: 70.w,height: 53.2.h,),
                ),
              ),
              SizedBox(height: 20.h,),
              Text('OTP Verified',style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
              ),)
            ],
          ),
        ),
      ),
    );
  }
}