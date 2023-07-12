import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sc_01/widgets/sizedbox.dart';
import 'package:sc_01/widgets/text.dart';
import 'package:sc_01/widgets/textfield.dart';

class AdoptViewPage extends StatefulWidget {
  const AdoptViewPage({Key? key}) : super(key: key);

  @override
  State<AdoptViewPage> createState() => _AdoptViewPageState();
}

class _AdoptViewPageState extends State<AdoptViewPage> {
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
        child: SingleChildScrollView(
          child: Column(
            children: [

              sbh30,
              Center(child: Image.asset('assets/images/Rectangle 70.png')),
              text('Puppy', 15.sp, Colors.black, FontWeight.w600),
              sbh30,
              SizedBox(
                child: Column(

                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    text('Catogory :', 15.sp, Colors.black, FontWeight.w400),
                    text('Breed :', 15.sp, Colors.black, FontWeight.w400),
                    text('Color :', 15.sp, Colors.black, FontWeight.w400),
                    text('Gender :', 15.sp, Colors.black, FontWeight.w400),
                    text('Collocted from :', 15.sp, Colors.black, FontWeight.w400),
                    text('Collocted on :', 15.sp, Colors.black, FontWeight.w400),
                    text('Health condition :', 15.sp, Colors.black, FontWeight.w400),
                  ],
                ),
              ),
              sbh30,
              Container(
                height: 101.h,
                width: 229.w,

                decoration: BoxDecoration(
                  color: Color(0xFF411619).withOpacity(.32),
                  borderRadius: BorderRadius.circular(30.r),
                ),
                child: Padding(
                  padding:  EdgeInsets.all(15.0.h),
                  child: text('description about the animal', 14.sp, Colors.black, FontWeight.w400),
                ),
              ),
              sbh30,
              SizedBox(
                width: 142.w,
                height: 40.h,
                child: TextButton(

                  onPressed: () {},
                  style: TextButton.styleFrom(
                      backgroundColor: Color(0xFF20614A),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.r)
                      )
                  ),
                  child: Text('ADOPT',
                    style: TextStyle(
                      color: const Color(0xFFFFFFFF),
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              )


            ],
          ),
        ),
      ),
    );
  }
}