import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sc_01/widgets/text.dart';

import '../widgets/sizedbox.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({Key? key}) : super(key: key);

  @override
  State<AboutUsPage> createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              text('About us', 20.sp, Colors.black, FontWeight.w400),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 125.w, vertical: 5.h),
                child: SizedBox(
                    height: 115.h,
                    width: 115.w,
                    child: Image.asset(
                        'assets/images/Rectangle_28-removebg-preview.png')),
              ),
              sbh30,
              SizedBox(
                height: 582.h,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        text(
                            'Stray Care is a dedicated organization committed to improving the well-being of stray animals in India. Our mission is to create a compassionate and sustainable solution for addressing the challenges faced by these vulnerable beings. Through a multifaceted approach that combines rescue, rehabilitation, responsible management, and community education, we strive to make a lasting impact on the lives of stray animals and the communities they inhabit.',
                            12.sp,
                            Colors.black,
                            FontWeight.w400),
                        sizedbox(10.h, 0.0),
                        text(
                            'At Stray Care, we understand the urgent need to address the issues surrounding stray animals in India. Our team of passionate animal lovers, volunteers, and professionals work tirelessly to provide a safe haven and a voice for these innocent creatures. We believe that every life matters, and it is our responsibility to protect and care for those who cannot speak for themselves.',
                            12.sp,
                            Colors.black,
                            FontWeight.w400),
                        sizedbox(10.h, 0.0),
                        text(
                            "Our organization collaborates closely with local animal welfare organizations, NGOs, and concerned citizens to develop and implement effective strategies. By building strong partnerships and fostering a sense of community, we aim to create a network of support that can truly make a difference.",
                            12.sp,
                            Colors.black,
                            FontWeight.w400),
                        sizedbox(10.h, 0.0),
                        text(
                            "Stray Care also recognizes the importance of education and awareness in creating a compassionate society. We actively engage in public awareness campaigns, workshops, and outreach programs to promote animal welfare, encourage adoption, and foster empathy and respect towards all living beings.",
                            12.sp,
                            Colors.black,
                            FontWeight.w400),
                        sizedbox(10.h, 0.0),
                        text(
                            "We are driven by our unwavering commitment to the welfare of stray animals and believe that together, we can create a brighter future for them. Join us in our mission to make a positive impact and help build a society where every stray animal receives the love, care, and protection they deserve.",
                            12.sp,
                            Colors.black,
                            FontWeight.w400),
                        sizedbox(10.h, 0.0),
                        text(
                            "Together, let's make a difference and build a more compassionate world for stray animals in India.",
                            12.sp,
                            Colors.black,
                            FontWeight.w400),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}