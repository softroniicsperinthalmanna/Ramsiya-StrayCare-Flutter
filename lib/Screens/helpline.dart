import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart';

import '../CONNECTION/connection.dart';
import '../widgets/sizedbox.dart';
import '../widgets/text.dart';

class HelpLinePage extends StatefulWidget {
  const HelpLinePage({Key? key}) : super(key: key);

  @override
  State<HelpLinePage> createState() => _HelpLinePageState();
}

class _HelpLinePageState extends State<HelpLinePage> {
  var flag;
  Future<dynamic> getPhoneNo() async {
    var response = await get(Uri.parse('${Con.url}viewPhoneNo.php'));
    print(response.body);
    var res2 = jsonDecode(response.body)[0]['result'];
    print('result is : $res2');
    if (res2 == "success") {
      flag = 1;
      return jsonDecode(response.body);
    } else {
      flag = 0;
    }
    //  return jsonDecode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/Android Large - 2.png'),
              fit: BoxFit.cover,
            ),
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            // text('Help Line', 20.sp, Colors.black, FontWeight.w400),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 125.w, vertical: 15.h),
              child: SizedBox(
                  height: 115.h,
                  width: 115.w,
                  child: Image.asset(
                      'assets/images/Rectangle_28-removebg-preview.png')),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 30.h),
              child: Center(
                  child: text('OUR STRAY CARE OFFICES ', 20.sp, Colors.black,
                      FontWeight.w600)),
            ),
            FutureBuilder(
                future: getPhoneNo(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) print('Error:${snapshot.error}');
                  print('Inside office details: ${snapshot.hasData}');
                  if (!snapshot.hasData) {
                    return const Center(
                      child: Text('No Data..'),
                    );
                  }

                  return flag == 0
                      ? Center(child: Text('Nothing to show'))
                      : Padding(
                          padding: EdgeInsets.all(10.w),
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, index) {
                              return Card(
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.r)),
                                child: ListTile(
                                  leading: Icon(
                                    Icons.house_outlined,
                                    size:
                                        MediaQuery.of(context).size.width * 0.1,
                                    color: Colors.black,
                                  ),
                                  title: text(
                                      ' ${snapshot.data[index]['location']}',
                                      16.sp,
                                      Colors.black,
                                      FontWeight.w400),
                                  subtitle: Padding(
                                    padding: EdgeInsets.only(left: 5.w),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        text(
                                            ' ${snapshot.data[index]['email']}',
                                            14.sp,
                                            Colors.black,
                                            FontWeight.w400),
                                        text(
                                            ' ${snapshot.data[index]['phone']}',
                                            14.sp,
                                            Colors.blue,
                                            FontWeight.w400),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                }),
          ]),
        ),
      ),
    );
  }
}
