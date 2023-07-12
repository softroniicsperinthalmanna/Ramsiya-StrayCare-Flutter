import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart';
import 'package:sc_01/Auth/sign_in.dart';
import 'package:sc_01/Screens/User/userhome.dart';

import '../Connection/connection.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final lightText = const Color(0xFFBDC3C7);
  final darkcolor = const Color(0xFF000000);
  final lightcolor = const Color(0xFFFFFFFF);

  var namectr = TextEditingController();
  var emailctr = TextEditingController();
  var placectr = TextEditingController();
  var phonectr = TextEditingController();
  var passwordctr = TextEditingController();

  Widget getTextField(String hint, TextEditingController ctr) {
    return Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(50.r),
      child: TextField(
          controller: ctr,
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
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {});
  }

  Future<void> signUp() async {
    var data = {
      "name": namectr.text,
      'email': emailctr.text,
      "place": placectr.text,
      "phone": phonectr.text,
      "password": passwordctr.text,
    };
    print("inside send data 1");
    var response = await post(Uri.parse('${Con.url}register.php'), body: data);
    print("inside send data");
    if (jsonDecode(response.body)['result'] == 'Success') {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Registered....')));
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const SignInPage()));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Failed to register !!....')));
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => SignUpPage()));
    }
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
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
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

                //Container for signup section
                Padding(
                  padding:
                      EdgeInsets.only(bottom: 30.h, right: 30.w, left: 30.w),
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
                            padding: EdgeInsets.only(
                              top: 20.h,
                              bottom: 30.h,
                            ),
                            child: Text(
                              'Lets get Started',
                              style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),

                          //textfield for email
                          getTextField('FullName', namectr),
                          SizedBox(
                            height: 25.h,
                          ),
                          getTextField('Email', emailctr),
                          SizedBox(
                            height: 25.h,
                          ),
                          getTextField('Place', placectr),
                          SizedBox(
                            height: 25.h,
                          ),
                          getTextField('Phone', phonectr),
                          SizedBox(
                            height: 25.h,
                          ),
                          getTextField('Password', passwordctr),
                          SizedBox(
                            height: 25.h,
                          ),

                          //signup button
                          SizedBox(
                            height: 43.h,
                            width: 146.w,
                            child: OutlinedButton(
                                onPressed: () {
                                  print('sign up button pressed');
                                  if (namectr.text.isNotEmpty &&
                                      emailctr.text.isNotEmpty &&
                                      placectr.text.isNotEmpty &&
                                      phonectr.text != null &&
                                      passwordctr.text.isNotEmpty) {
                                    setState(() {
                                      signUp();
                                      print('ready to add fields');
                                    });
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content: Text(
                                                'All fields required !!!....')));
                                  }
                                },
                                style: OutlinedButton.styleFrom(
                                    backgroundColor: darkcolor,
                                    foregroundColor: lightcolor,
                                    elevation: 5.0,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(120.r))),
                                child: Text('SIGN UP',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16.sp,
                                    ))),
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
      ),
    );
  }
}
