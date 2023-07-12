import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sc_01/Screens/User/Report/report-injured.dart';

import '../../../widgets/sizedbox.dart';

class ReportCatogoryPage extends StatefulWidget {
  const ReportCatogoryPage({Key? key}) : super(key: key);

  @override
  State<ReportCatogoryPage> createState() => _ReportCatogoryPageState();
}

class _ReportCatogoryPageState extends State<ReportCatogoryPage> {
  void ToReportingCasePage( {caseType}){
    Navigator.push(context, MaterialPageRoute(builder: (context) => ReportingCasePage(
        cType:caseType
    )));

  }
  Widget getbutton({required String text,required VoidCallback callback}) {
    return SizedBox(
      height: 75.h,
      width: 299.w,
      child: ElevatedButton(
          onPressed: callback,
          style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF0F0E0E).withOpacity(0.75),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0.r),
              )),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w600,
            ),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 112.h,
        actions: [
          Padding(
            padding: EdgeInsets.only(
              top: 10.h,
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
      body:Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Color(0xFFFFCE56),
        child: Padding(
          padding:EdgeInsets.only(
              bottom: 53.h
          ),
          child: Container(
            height: 622.h,
            width: 360.w,
            color: Color(0xFFFFFFFF),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                sbh30,

                getbutton(text: 'STRAY ANIMAL',callback: ()=>ToReportingCasePage(caseType: 'stray')),
              //  sbh10,
                getbutton(text: 'INJURED ANIMAL',callback: ()=>ToReportingCasePage(caseType: 'injured')),
               // sbh10,
                getbutton(text: 'AGRESSIVE ANIMAL',callback: ()=>ToReportingCasePage(caseType: 'aggressive')),
               // sbh10,
                getbutton(text: 'WILD ANIMAL',callback: ()=>ToReportingCasePage(caseType: 'wild')),
               // sbh10,
                getbutton(text: 'ABUSE TOWARDS ANIMALS',callback: ()=>ToReportingCasePage(caseType: 'abuse')),
                sbh10,
              ],
            ),
          ),
        ),
      ),

    );
  }
}