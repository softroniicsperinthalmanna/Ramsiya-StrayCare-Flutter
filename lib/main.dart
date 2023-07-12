import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sc_01/Screens/User/Donate/donate.dart';
import 'package:sc_01/Boarding/welcome.dart';

import 'Screens/Forest/wild.dart';
import 'Screens/Office/collectedlist.dart';
import 'Screens/Office/createCollectionList.dart';
import 'Screens/Office/createCollectionListDemo.dart';
import 'Screens/Office/officehome.dart';
import 'Screens/Office/stray.dart';
import 'Screens/Police/abuse.dart';
import 'Screens/Veterinary/injured.dart';
import 'Screens/User/Adopt/adopt.dart';
import 'Screens/adoptview.dart';
import 'Screens/User/Donate/donation.dart';
import 'Screens/User/Find/find.dart';
import 'Screens/User/Find/missing_pet_list.dart';
import 'Screens/User/Adopt/officeadopt.dart';
import 'Screens/User/Report/report-injured.dart';
import 'Screens/User/Report/report_animal_issue.dart';
import 'Screens/User/Report/reportcategory.dart';
import 'Boarding/screenone.dart';
import 'Auth/sign_in.dart';
import 'Auth/signincatogories.dart';
import 'Auth/signup.dart';
import 'Screens/User/userhome.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (_, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              iconTheme: const IconThemeData(
                color: Colors.black,
              ),
              textTheme: GoogleFonts.interTextTheme(
                Theme.of(context).textTheme,
              ),
              appBarTheme: const AppBarTheme(
                backgroundColor: Color(0xFFFFCE56),
              ),
              bottomAppBarTheme: BottomAppBarTheme(
                color: Color(0xFFFFCE56),
              )),
          home: ScreenOne()
          //WelcomePage()
          //MissingPetListPage(),

          //ReportAnimalIssuePge()
          //AdoptViewPage()
          //SigninCatogoriesPage()
          // OfficeAdoptPage()
          //ReportPetMissingPage()

          //ModuleView()
          //DeathReasonPage()
          //FosteringDetailPage()
          //OfficeFosteringPage()

          //DeadDetailsPage()
          //OfficeDeadPage()
          //MoveToFoster()
          //OficeCollectedPage()
          //OfficeHomePage()
          //MissingDogsPage()
          // DonationDone()

          //OtpVerifiedPage(),
          //ScreenTwo(),
          //ScreenOne(),
          ),
      designSize: const Size(360, 800),
    );
  }
}
