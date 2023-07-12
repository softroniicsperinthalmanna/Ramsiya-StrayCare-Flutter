import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart';

import '../../../CONNECTION/connection.dart';
import '../../../SharedpreferenceUse/spUse.dart';
import '../../../widgets/sizedbox.dart';
import 'donationdone.dart';

class DonationPage extends StatefulWidget {
  const DonationPage({Key? key}) : super(key: key);

  @override
  State<DonationPage> createState() => _DonationPageState();
}

class _DonationPageState extends State<DonationPage> {
  var selectedIndex = -1;
  bool showBorder = true;
  var amt = TextEditingController();
  var _selectedPay;
  List<String> pay = [
    'assets/images/Rectangle 83.png',
    'assets/images/Rectangle 82.png',
    'assets/images/Rectangle 81.png',
    'assets/images/other2.png',
  ];

  var lid;
  void initState() {
    super.initState();
    setState(() {
      SharedPreferencesHelper.getSavedData().then((value) {
        setState(() {
          lid = value;
        });
      });
      // myLogin();
    });
  }

  Future<void> sendData() async {
    // print(widget.uid);
    print(amt.text);
    print(selectedIndex);
    print(_selectedPay);
    var data = {
      "uid": lid.toString(),
      "amt": amt.text,
      "method": _selectedPay,
      "date": DateTime.now().toString(),
    };
    var response = await post(Uri.parse('${Con.url}donation.php'), body: data);
    print(response.body);
    print(response.statusCode);
    if (jsonDecode(response.body)['result'] == 'Success') {
      //  Navigator.pop(context);

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => DonationDone()));

      // Navigator.pop(context);
      //
      // ScaffoldMessenger.of(context)
      //     .showSnackBar(SnackBar(content: Text(' Successfully Donated....')));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(' Failed to Donate !!....')));
      Navigator.pop(context);
    }
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
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    //padding: EdgeInsets.symmetric(horizontal: 43.w,vertical: 90.h),
                    padding: EdgeInsets.only(
                        top: 90.h, left: 43.w, right: 43.w, bottom: 43.h),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: amt,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40.r)),
                          // hintText: 'Enter amount',
                          label: Text('Enter Amount'),
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 15.sp,
                            color: Color(0xFFBDC3C7),
                          )),
                    ),
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //   children: [
                  //      InkWell(
                  //        onTap: (){
                  //          selectedPay=0;
                  //        },
                  //        child: Container(
                  //          height: 70.h,
                  //          width: 70.h,
                  //            child: Image.asset('assets/images/Rectangle 83.png',fit: BoxFit.cover,)),
                  //      ),
                  //      InkWell(
                  //        onTap: (){
                  //          selectedPay=1;
                  //        },
                  //        child: Container(
                  //          height: 70.h,
                  //          width: 70.h,
                  //            child: Image.asset('assets/images/Rectangle 82.png',fit: BoxFit.fill,)),
                  //      ),
                  //      InkWell(
                  //        onTap: (){
                  //          selectedPay=2;
                  //        },
                  //        child: Container(
                  //          height: 70.h,
                  //          width: 70.h,
                  //            child: Image.asset('assets/images/Rectangle 81.png',fit: BoxFit.fill,)),
                  //      ),
                  //     // Image.asset('assets/images/Rectangle 82.png'),
                  //     // Image.asset('assets/images/Rectangle 81.png'),
                  //   ],
                  // ),
                  // SizedBox(
                  //   height: 50.h,
                  // ),
                  Container(
                    height: 200.h,
                    width: 350.w,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        //  top: 10.0,
                        bottom: 10.0,
                        left: 70.0,
                        right: 70.0,
                      ),
                      child: GridView.builder(
                        itemCount: pay.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 1.5,
                            mainAxisSpacing: 50,
                            crossAxisSpacing: 50),
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedIndex = index;
                              });
                            },
                            child: Container(
                              height: 90.h,
                              width: 90.h,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: selectedIndex == index
                                      ? Colors.blue
                                      : Colors.transparent,
                                  width: 2.0.w,
                                ),
                              ),
                              child: Image.asset(
                                pay[index],
                                fit: BoxFit.fill,
                              ),
                            ),
                          );
                        },
                      ),

                      //      child: GridView(
                      // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      //       crossAxisCount: 2,
                      //   childAspectRatio: 1.5,
                      //   mainAxisSpacing: 50,
                      //   crossAxisSpacing: 50
                      //
                      // ),
                      //        children: [
                      //          InkWell(
                      //            onTap: (){
                      //
                      //              setState(() {
                      //                selectedPay=0;
                      //                showBorder=!showBorder;
                      //              });
                      //
                      //            },
                      //            child: ClipOval(
                      //              child: Container(
                      //                  height: 70.h,
                      //                  width: 70.h,
                      //                  decoration: showBorder
                      //                      ? BoxDecoration(
                      //                    border: Border.all(
                      //                      color: Colors.blue,
                      //                      width: 2.0,
                      //                    ),
                      //                  )
                      //                      : null,
                      //                  child: Image.asset('assets/images/Rectangle 83.png',fit: BoxFit.fill,)),
                      //            ),
                      //          ),
                      //          InkWell(
                      //            onTap: (){
                      //
                      //              setState(() {
                      //                selectedPay=1;
                      //                showBorder=!showBorder;
                      //              });
                      //
                      //
                      //            },
                      //            child: Container(
                      //                height: 70.h,
                      //                width: 70.h,
                      //                child: Image.asset('assets/images/Rectangle 82.png',fit: BoxFit.fill,)),
                      //          ),
                      //          InkWell(
                      //            onTap: (){
                      //
                      //              setState(() {
                      //                selectedPay=2;
                      //                showBorder=!showBorder;
                      //              });
                      //            },
                      //            child: Container(
                      //                height: 70.h,
                      //                width: 70.h,
                      //                decoration: showBorder
                      //                    ? BoxDecoration(
                      //                  border: Border.all(
                      //                    color: Colors.blue,
                      //                    width: 2.0,
                      //                  ),
                      //                )
                      //                    : null,
                      //                child: Image.asset('assets/images/Rectangle 81.png',fit: BoxFit.fill,)),
                      //          ),
                      //          InkWell(
                      //            onTap: (){
                      //
                      //              setState(() {
                      //                selectedPay=2;
                      //                showBorder=!showBorder;
                      //              });
                      //            },
                      //            child: Container(
                      //                height: 70.h,
                      //                width: 70.h,
                      //                decoration: showBorder
                      //                    ? BoxDecoration(
                      //                  border: Border.all(
                      //                    color: Colors.blue,
                      //                    width: 2.0,
                      //                  ),
                      //                )
                      //                    : null,
                      //                child: Image.asset('assets/images/other1.png',fit: BoxFit.cover,)),
                      //          ),
                      //
                      //          // Image.asset('assets/images/Rectangle 82.png'),
                      //          // Image.asset('assets/images/Rectangle 81.png'),
                      //        ],
                      //      ),
                    ),
                  ),
                  sbh30,
                  //submit button
                  SizedBox(
                    height: 66.h,
                    width: 263.w,
                    child: OutlinedButton(
                      onPressed: () {
                        switch (selectedIndex) {
                          case 0:
                            _selectedPay = 'PhonePe';
                            break;
                          case 1:
                            _selectedPay = 'Google Pay';
                            break;
                          case 2:
                            _selectedPay = 'Paytm';
                            break;
                          case 3:
                            _selectedPay = 'Other';
                            break;
                        }
                        if (amt.text == null || amt.text.isEmpty) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text(
                              'Enter amount',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                            backgroundColor: Color(0xfa8f7805),
                          ));
                        }
                        if (selectedIndex == -1) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text(
                              'select payment method',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                            backgroundColor: Color(0xfa8f7805),
                          ));
                        }

                        if (amt.text.isNotEmpty && selectedIndex != -1) {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text('$_selectedPay'),
                                  content: Text('Amount: ₹ ${amt.text}'),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          setState(() {
                                            sendData();
                                          });
                                        },
                                        child: Text('Ok'))
                                  ],
                                );
                              });
                        }
                      },
                      style: OutlinedButton.styleFrom(
                          backgroundColor: Color(0xFF20614A),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.r),
                          )),
                      child: Text(
                        'submit',
                        style: TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontWeight: FontWeight.w600,
                          fontSize: 20.sp,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
