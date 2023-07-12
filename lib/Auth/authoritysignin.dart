import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart';
import 'package:sc_01/Screens/Forest/wild.dart';
import 'package:sc_01/Screens/LSG/aggressive.dart';
import 'package:sc_01/Screens/Police/abuse.dart';

import '../CONNECTION/connection.dart';
import '../SharedpreferenceUse/spUse.dart';
import '../Screens/Office/officehome.dart';
import '../Screens/Veterinary/injured.dart';

class AuthoritySignIn extends StatefulWidget {
  AuthoritySignIn({Key? key, required this.userType}) : super(key: key);
  var userType;
  @override
  State<AuthoritySignIn> createState() => _AuthoritySignInState();
}

class _AuthoritySignInState extends State<AuthoritySignIn> {
  final lightText = const Color(0xFFBDC3C7);
  final darkcolor = const Color(0xFF000000);
  final lightcolor = const Color(0xFFFFFFFF);

  var code = TextEditingController();
  var pswd = TextEditingController();
  var flag = 0;
  var authority;
  @override
  void initState() {
    super.initState();
    authority = widget.userType;
  }

  Future<dynamic> signIn() async {
    var data = {
      "code": code.text,
      "password": pswd.text,
      "type": widget.userType
    };
    var response =
        await post(Uri.parse('${Con.url}authoritylogin.php'), body: data);
    print(response.body);
    print(response.statusCode);
    var loginID;
    if (response.statusCode == 200) {
      if (jsonDecode(response.body)['result'] == 'Success') {
        flag = 1;
        print('flag value:$flag');

        loginID = jsonDecode(response.body)['log_id'];
        print(loginID);
        print('loginID inside sign in success :$loginID');
        SharedPreferencesHelper.saveData(loginID).then((_) {
          print('sp saved..');
          // Login ID saved successfully
          // You can perform any additional actions here
        }).catchError((error) {
          print('sp saving failed..');
          // Error occurred while saving the login ID
          // Handle the error as needed
        });

        print(loginID);

        if (flag == 1) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Logging In ...')));
          print(loginID);
          // Navigator.pushReplacement(context,
          //     MaterialPageRoute(builder: (context) => SellerHome(
          //
          //       logId: loginID.toString(),
          //     )));
          switch (authority) {
            case 'office':
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => OfficeHomePage(

                          //      logID: loginID.toString(),
                          )));
              break;
            case 'lsg':
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ViewAggressiveCase(

                          //   logID: loginID.toString(),
                          )));
              break;
            case 'forest':
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ViewWildCase(

                          //   logID: loginID.toString(),
                          )));
              break;
            case 'vet':
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ViewInjuredCase(

                          //   logID: loginID.toString(),
                          )));
              break;
            case 'police':
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ViewAbuseCase(

                          //   logID: loginID.toString(),
                          )));
              break;
          }
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(' Login Failed')));
          // Navigator.pushReplacement(context,
          //     MaterialPageRoute(builder: (context) => Login()));
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Invalid Credential ! Login Failed !')));
        // Navigator.pushReplacement(context,
        //     MaterialPageRoute(builder: (context) => Login(
        //
        //     )));
      }
      return jsonDecode(response.body);
    } else {
      return Center(child: CircularProgressIndicator());
    }
  }

  Widget getTextField({required String hint, required controller}) {
    return Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(50.r),
      child: TextField(
          controller: controller,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50.r),
                  borderSide:
                      BorderSide(color: darkcolor, style: BorderStyle.solid)),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
              hintText: hint,
              hintStyle: TextStyle(
                fontSize: 16.sp,
                color: lightText,
              ))),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        //Container for background image
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/images/Android Large - 1.png'),
            fit: BoxFit.cover,
          )),
          child: ListView(
            //  mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //logo image
              Padding(
                padding: EdgeInsets.symmetric(vertical: 19.h),
                child: Image.asset(
                  'assets/images/Rectangle_28-removebg-preview.png',
                  width: 111.w,
                  height: 136.h,
                ),
              ),

              //Container for login section
              Padding(
                padding: EdgeInsets.only(bottom: 30.h, right: 30.w, left: 30.w),
                child: Container(
                  height: 532.h,
                  width: 309.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.r),
                    color: lightcolor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        //let's get started text
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 40.h),
                          child: Text(
                            "Let's get Started",
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),

                        //textfield for email
                        getTextField(hint: 'Usercode', controller: code),
                        SizedBox(
                          height: 30.h,
                        ),
                        getTextField(hint: 'Password', controller: pswd),
                        SizedBox(
                          height: 30.h,
                        ),

                        //signin button
                        SizedBox(
                          height: 43.h,
                          width: 146.w,
                          child: OutlinedButton(
                              onPressed: () {
                                if (code.text.isNotEmpty &&
                                    pswd.text.isNotEmpty) {
                                  signIn();
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content:
                                              Text('All fields required...')));
                                }
                              },
                              style: OutlinedButton.styleFrom(
                                  backgroundColor: darkcolor,
                                  foregroundColor: lightcolor,
                                  elevation: 5.0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(120.r))),
                              child: Text('SIGN IN',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16.sp,
                                  ))),
                        ),

                        //sign in with facbook or google
                        Padding(
                          padding: EdgeInsets.all(20),
                          child: Wrap(
                            //  mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                  width: 26.w,
                                  child: const Divider(
                                    color: Color(0xFFD9D9D9),
                                  )),
                              SizedBox(
                                width: 10.w,
                              ),
                              const Text('If feeling lazy'),
                              SizedBox(
                                width: 10.w,
                              ),
                              SizedBox(
                                width: 26.w,
                                child: const Divider(
                                  color: Color(0xFFD9D9D9),
                                ),
                              ),
                            ],
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.only(
                            left: 83.w,
                            right: 83.w,
                            bottom: 28.h,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/fblogo.png',
                                width: 28.w,
                                height: 28.h,
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Image.asset(
                                'assets/images/Rectangle 7.png',
                                width: 28.w,
                                height: 28.h,
                              ),
                            ],
                          ),
                        ),
                      ],
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
