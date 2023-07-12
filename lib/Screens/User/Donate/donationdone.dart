import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:sc_01/Screens/User/Donate/donate.dart';

class DonationDone extends StatefulWidget {
  const DonationDone({Key? key}) : super(key: key);

  @override
  State<DonationDone> createState() => _DonationDoneState();
}

class _DonationDoneState extends State<DonationDone> {
  @override
  void initState(){
    super.initState();
    _navigateBackAfterDelay();
  }
  void _navigateBackAfterDelay() {
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>DonatePage()));
    });
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
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Color(0xFFFFCE56),
            child: Padding(
              padding: EdgeInsets.only(bottom: 53.h),
              child: Container(
                height: 622.h,
                width: 360.w,
                color: Color(0xFFFFFFFF),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: SizedBox(
                            height: 200.h,
                            width: 200.w,
                            child: Lottie.asset('assets/lottiefiles/125891-success-box-blue-and-green-check.json')),
                      ),
                    ]),
              ),
            )));
  }
}