import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sc_01/Screens/User/Report/reportcategory.dart';
import 'package:sc_01/widgets/sizedbox.dart';
import 'package:sc_01/widgets/text.dart';

class ReportAnimalIssuePge extends StatelessWidget {
  const ReportAnimalIssuePge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        toolbarHeight: 112.h,
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
        color: const Color(0xFFFFCE56),

        child: Padding(
          padding: EdgeInsets.only(bottom: 30.h),
          child: Container(
            height: 622.h,
            decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/Rectangle 166.png', ),
                  fit: BoxFit.fill,

                )),
            child: Column(
              children: [

                sbh30,
                Center(
                  child: text('REPORT ANIMAL ISSUES',  20.sp, const Color(0xFFFFFFFF), FontWeight.w800),
                ),

                sbh30,
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: SizedBox(
                    height: 367.h,
                    width: 328.w,
                    child: Wrap(
                      children: [
                        text('WHAT TO DO IF YOU SEE ANIMAL CRUELTY? ', 16.sp, Colors.white,FontWeight.w600),
                        Text('1.Record a video and take pictures with an app that shows the date,time,and location. Without evidence ,we or police or court cannot help.',
                          style:  TextStyle(
                              fontSize: 20.sp,
                              color: const Color(0xFFFFFFFF)
                          ),
                          textScaleFactor:0.8,
                          textAlign: TextAlign.justify,
                        ),
                        Text('2.Stop the abuse.if it doesn’t stop,raise your voice.',
                          style: TextStyle(
                              fontSize: 20.sp,
                              color: const Color(0xFFFFFFFF)
                          ),
                          textScaleFactor:0.8,
                          textAlign: TextAlign.justify,
                        ),
                        Text('3.Call people around.Call police.',
                          style: TextStyle(
                              fontSize: 20.sp,
                              color: const Color(0xFFFFFFFF)
                          ),
                          textScaleFactor:0.8,
                          textAlign: TextAlign.justify,
                        ),
                        Text('4.Meanwhile explain the laws that injuring or killing an animal is punishable as per to section 11(1)(L) of The prevention of cruelty to Animal Act(PCA)1960.',
                          style:  TextStyle(
                              fontSize: 20.sp,
                              color: const Color(0xFFFFFFFF)
                          ),
                          textScaleFactor:0.8,
                          textAlign: TextAlign.justify,
                        ),
                        Text('5.Report cruelty using below form,we will act',
                          style: TextStyle(
                              fontSize: 20.sp,
                              color: const Color(0xFFFFFFFF)
                          ),
                          textScaleFactor:0.8,
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 165.w,
                  height: 53.h,
                  child: TextButton(onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return ReportCatogoryPage();
                    }));
                  },
                    style: TextButton.styleFrom(
                      backgroundColor: const Color(0xFFFFCE56),

                    ),
                    child: Text('REPORT',
                      style: TextStyle(
                        color: const Color(0xFFFFFFFF),
                        fontSize: 20.sp,fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}