import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'donation.dart';

class DonatePage extends StatelessWidget {
  const DonatePage({Key? key}) : super(key: key);

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
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/Android Large - 2do.png'),
                fit: BoxFit.fill,
              )),
          child: SingleChildScrollView(
            child: Column(
              children: [

                //heading text
                Padding(
                  padding: EdgeInsets.only(
                    top: 40.h,
                    bottom: 35.h,
                    left: 20.w,
                  ),
                  child: Text(
                    'GIVING STRAY ANIMALS A CHANCE',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 24.sp,
                        color: Color(0xFFFFFFFF)),
                  ),
                ),

                //paragraph text
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Text(
                    'Whether it’s a loving adoptive home or simply a better chance on the streets, we’re fighting to give stray animals a better life in India. Despite its smart, social personality, India’s native dog breed, the “Pariah Dog”, is misunderstood as wild and dangerous, resulting in the local population being highly reluctant to adopt these animals.',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Color(0xFFFFFFFF),
                      fontSize: 16.sp,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),


                //Donate button
                Padding(
                  padding:EdgeInsets.symmetric(vertical: 90.h),
                  child: SizedBox(
                    height: 50.h,
                    width: 183.w,
                    child: TextButton(onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => DonationPage()));
                    },
                        style: TextButton.styleFrom(
                            backgroundColor: Color(0xFFFFCE56)
                        ),
                        child: Text('DONATE',
                          style: TextStyle(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w600,
                            color:  Color(0xFFFFFFFF),
                          ),)),
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