import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:sc_01/Auth/signup.dart';
import 'package:sc_01/Screens/User/userhome.dart';
import 'package:sc_01/SharedpreferenceUse/spUse.dart';

import '../CONNECTION/connection.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  var email = TextEditingController();
  var pswd = TextEditingController();
  var flag;
  Future<dynamic> userSignIn() async {
    var data = {"email": email.text, "password": pswd.text};
    var response = await post(Uri.parse('${Con.url}userLogin.php'), body: data);
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

        // saveData(loginID);
        SharedPreferencesHelper.saveData(loginID).then((_) {
          print('sp saved...');
        }).catchError((error) {
          print('sp saving failed..');
          // Error occurred while saving the login ID
          // Handle the error as needed
        });

        if (flag == 1) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Logging In ...')));
          print(loginID);
          // Navigator.pushReplacement(context,
          //     MaterialPageRoute(builder: (context) => SellerHome(
          //
          //       logId: loginID.toString(),
          //     )));

          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => UserHomePage(

                      //      logID: loginID.toString(),
                      )));
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Login Failed')));
          // Navigator.pushReplacement(context,
          //     MaterialPageRoute(builder: (context) => Login()));
        }
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Login Failed')));
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

  final lightText = const Color(0xFFBDC3C7);
  final darkcolor = const Color(0xFF000000);
  final lightcolor = const Color(0xFFFFFFFF);

  Widget getTextField(
      {required String hint, required controller, obText = false}) {
    return Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(50.r),
      child: TextField(
          controller: controller,
          obscuringCharacter: '*',
          obscureText: obText,
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
                        getTextField(hint: 'Email', controller: email),
                        SizedBox(
                          height: 30.h,
                        ),
                        getTextField(
                            hint: 'Password', controller: pswd, obText: true),
                        SizedBox(
                          height: 30.h,
                        ),

                        //signin button
                        SizedBox(
                          height: 43.h,
                          width: 146.w,
                          child: OutlinedButton(
                              onPressed: () {
                                // userSignIn();
                                if (email.text.isNotEmpty &&
                                    pswd.text.isNotEmpty) {
                                  userSignIn();
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
                            //mainAxisAlignment: MainAxisAlignment.center,
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

                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignUpPage()));
                            },
                            child: RichText(
                              text: TextSpan(
                                  text: 'Not Registered Yet?',
                                  style:
                                      GoogleFonts.poppins(color: Colors.amber),
                                  children: [
                                    TextSpan(
                                        text: ' Sign Up',
                                        style: GoogleFonts.poppins(
                                            color: Colors.red, fontSize: 18))
                                  ]),
                            ))
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
