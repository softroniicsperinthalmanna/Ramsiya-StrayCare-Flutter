import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sc_01/widgets/sizedbox.dart';

import '../../../widgets/textfield.dart';
import 'missingdog.dart';

class MissingPetListPage extends StatefulWidget {
  const MissingPetListPage({Key? key}) : super(key: key);

  @override
  State<MissingPetListPage> createState() => _MissingPetListPageState();
}

class _MissingPetListPageState extends State<MissingPetListPage> {
  var searchContent = TextEditingController();

  Widget getTextButton({required String text, required VoidCallback callback}) {
    return Padding(
      padding: EdgeInsets.all(15.0.h),
      child: SizedBox(
        height: 65.h,
        width: 250.w,
        child: TextButton(
          onPressed: callback,
          style: TextButton.styleFrom(
              backgroundColor: Color(0XFF000000).withOpacity(0.25)),
          child: Text(text,
              style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFFFFFFFF))),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Color(0xFFFFCE56),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.menu,
                        size: MediaQuery.of(context).size.width * 0.1,
                      ),
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
                Padding(
                  padding: EdgeInsets.only(bottom: 20.0.h, top: 15.h),
                  child: Container(
                    height: 75.h,
                    width: 263.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(39.r),
                      color: const Color(0xFFCE3434).withOpacity(0.4),
                    ),
                    child: Center(
                      child: Text(
                        'MISSING PET LIST',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18.sp,
                          color: const Color(0xFFFFFFFF),
                        ),
                      ),
                    ),
                  ),
                ),

                //search bar
                // Padding(
                //   padding:  EdgeInsets.symmetric(horizontal: 25.w,
                //       vertical: 10.h),
                //  child: SizedBox(
                //      height: 50.h,
                //    //  width: ,
                //      child: textformfield(controller: searchContent, hint:'Search',fcolor: Colors.black,fsize: 15.sp,bordercolor: Colors.transparent,hpad: 20.w,vpad: 30.h,radius: 5.0,filled:true,fillcolor:Color(0XFFFFFFFF).withOpacity(0.45),s_icon: Icons.search)),
                //
                // ),
                // Container(
                //   height: 53.h,
                //   width: 310.w,
                //   decoration: BoxDecoration(
                //     color: Color(0XFFFFFFFF).withOpacity(0.45),
                //     borderRadius: BorderRadius.circular(8.r),
                //   ),
                //   child: Padding(
                //     padding:  EdgeInsets.symmetric(horizontal: 25.w,
                //         vertical: 10.h),
                //     child: Row(
                //       children: [
                //         Text('search',
                //           style: TextStyle(
                //             color: Color(0xFFBDC3C7),
                //             fontWeight: FontWeight.w600,
                //             fontSize: 15.sp,
                //           ),),
                //         SizedBox(width: 150.w),
                //         Icon(Icons.search,
                //           size:MediaQuery.of(context).size.width * 0.09 ,
                //         )
                //       ],
                //     ),
                //   ),
                // ),

                //select a catogory text

                sbh30,
                Text(
                  'Select a category :',
                  style: TextStyle(
                    fontSize: 20.sp,
                    color: Color(0xFFFFFFFF),
                    fontWeight: FontWeight.w600,
                  ),
                ),

                //catogories
                getTextButton(
                    text: 'DOG',
                    callback: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MissingDogsPage(
                                    missingCategory: 'DOGS',
                                  )));
                    }),
                getTextButton(
                    text: 'CAT',
                    callback: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  MissingDogsPage(missingCategory: 'CATS')));
                    }),
                getTextButton(
                    text: 'OTHER',
                    callback: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  MissingDogsPage(missingCategory: 'OTHER')));
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
