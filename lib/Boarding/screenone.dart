import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sc_01/Boarding/welcome.dart';

class ScreenOne extends StatefulWidget {
  const ScreenOne({Key? key}) : super(key: key);

  @override
  State<ScreenOne> createState() => _ScreenOneState();
}

class _ScreenOneState extends State<ScreenOne> {
  @override
  void initState() {
    super.initState();
    _navigatetopage();
  }

  _navigatetopage() async {
    await Future.delayed(Duration(milliseconds: 5000), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => WelcomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: const Color(0xFFFFCE56),
        child: Container(
          child: Center(
            child: Image.asset(
              'assets/images/Rectangle_28-removebg-preview.png',
              width: 261.w,
              height: 317.h,
            ),
          ),
        ),
      ),
    );
  }
}
