import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sc_01/Location/location_controller.dart';
import 'package:sc_01/widgets/sizedbox.dart';
import 'package:sc_01/widgets/textfield.dart';

import '../../../CONNECTION/connection.dart';
import '../../../SharedpreferenceUse/spUse.dart';

class ReportingCasePage extends StatefulWidget {
  ReportingCasePage({Key? key, required this.cType}) : super(key: key);
  var cType;

  @override
  State<ReportingCasePage> createState() => _ReportingCasePageState();
}

class _ReportingCasePageState extends State<ReportingCasePage> {
  var lid;
  @override
  void initState() {
    super.initState();
    SharedPreferencesHelper.getSavedData().then((value) {
      setState(() {
        lid = value;

        print(lid);
      });
    });
    // setState(() {
    //   myLogin();
    // });
  }

  // Future<void> myLogin() async {
  //   lid = await getSavedData();
  //   print('LoginID:$lid');
  // }

  var myLatitude;
  var myLongitude;

  File? _image;
  final picker = ImagePicker();
  TextEditingController description = TextEditingController();
  String? mapLocation;
  String myLoc = '-- Tap the button below to get your location --';

  //TextEditingController mapLocation = TextEditingController();

  Future chooseImage() async {
    print('choosing image');
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = File(pickedImage!.path);
    });
  }

  Future upload(File imageFile) async {
    //print(name.text);
    print('trying to upload');
    print('$imageFile');
    print(description.text);

    print(widget.cType);
    //   print(category);

    //var stream = http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
    //var length = await imageFile.length();
    var uri = Uri.parse("${Con.url}report.php");

    var request = http.MultipartRequest("POST", uri);
    // request.fields['bookName'] = name.text;
    request.fields['case_type'] = widget.cType;
    // request.fields['user_id'] = widget.uid;
    // request.fields['caseType'] = widget.cType;

    request.fields['user_id'] = lid.toString();
    request.fields['description'] = description.text;
    request.fields['location'] = myLoc;
    request.fields['lati'] = myLatitude.toString();
    request.fields['longi'] = myLongitude.toString();
    request.fields['reported_date'] = DateTime.now().toString();

    var pic = await http.MultipartFile.fromPath("image", imageFile.path);
    //var pic = http.MultipartFile("image",stream,length,filename: basename(imageFile.path));

    request.files.add(pic);
    var response = await request.send();
    print(response.statusCode);

    if (response.statusCode == 200) {
      //  upload(_image!);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          'Posting ...',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        backgroundColor: Color(0xfa8f7805),
      ));
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          'Posted Successfully ...',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        backgroundColor: Color(0xfa8f7805),
      ));

      Navigator.pop(context);
      print("image uploaded");
    } else {
      print("uploaded failed");
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocationController>(
        init: LocationController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              toolbarHeight: 112.h,
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
                    child: Column(children: [
                      sbh30,
                      //profile pic
                      Container(
                        height: 300.h,
                        width: 300.w,
                        color: Colors.amber,
                        // child: Image.asset('assets/images/Ellipse 7.png'),

                        child: _image == null
                            ? Stack(children: [
                                Center(
                                  child: InkWell(
                                    onTap: () {
                                      upload(_image!);
                                    },
                                    child: Card(
                                      elevation: 5,
                                      child: Container(
                                        //color: Colors.red,
                                        height: 300.h,
                                        width: 300.w,
                                        child: const Center(
                                            child: Text(
                                          '-- Click to select image --',
                                          //  style: normalTextPlay,
                                        )),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                    left: 130.w,
                                    top: 130.w,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.green,
                                      ),
                                      height: 50.w,
                                      width: 50.w,
                                      //   color: Colors.blueGrey[100],

                                      child: IconButton(
                                        icon: Icon(
                                          Icons.photo_camera_back_outlined,
                                          size: 30.w,
                                          color: Colors.red,
                                        ),
                                        onPressed: () {
                                          chooseImage();
                                        },
                                      ),
                                    ))
                              ])
                            : Image.file(
                                _image!,
                                fit: BoxFit.cover,
                              ),
                      ),

                      //description section
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.w, vertical: 15.w),
                        child: textformfield(
                            controller: description,
                            hint: 'Add a Description.....',
                            fcolor: Colors.black,
                            fsize: 20.sp,
                            bordercolor: Colors.black,
                            hpad: 20.w,
                            vpad: 30.h,
                            radius: 0.0,
                            fillcolor: Colors.transparent,
                            border_style: BorderStyle.solid),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.w, vertical: 15.w),
                        // child: textformfield(controller: mapLocation, hint:'',fcolor: Colors.black,fsize: 20.sp,bordercolor: Colors.black,hpad: 20.w,vpad: 30.h,radius: 0.0,fillcolor: Colors.transparent),
                        child: Text(
                          '$myLoc',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: myLoc ==
                                    '-- Tap the button below to get your location --'
                                ? Colors.red
                                : Colors.black,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.w, vertical: 15.w),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                color: Color(0xFFFFCE56),
                              ))),
                          onPressed: () {
                            setState(() {
                              controller.getCurrentLocation();
                              // mapLocation.text= controller.currentLocation == null ? '--No Location Selected--' :
                              // controller.currentLocation!;
                              mapLocation = controller.currentLocation == null
                                  ? myLoc
                                  : controller.currentLocation!;
                              myLoc = mapLocation!;
                              myLatitude = controller.myLat;
                              myLongitude = controller.myLong;
                              print(myLatitude);
                              print(myLongitude);
                            });

                            //style: blackTextPlay,
                            // mapLocation=controller.currentLocation!;
                            // print(controller.currentLocation!);
                            // print(mapLocation);
                          },
                          child: Center(
                            child: ListTile(
                              title: Text(
                                'Get My Location',
                                // style: normalTextPlay,
                              ),
                              leading: Icon(Icons.location_on_outlined),
                            ),
                          ),
                        ),
                      ),

                      //Location
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 30.w,
                        ),
                        // child: textfield('Location', Colors.black, 20.sp,  Colors.transparent, 30.w, 15.h, 5.0.r, const Color(0xFFD9D9D9)),
                        // child: textfield('Location', Colors.black, 20.sp,  Colors.transparent, 30.w, 15.h, 5.0.r, const Color(0xFFD9D9D9)),
                      ),

                      sbh30,
                      //submit button
                      SizedBox(
                        height: 66.h,
                        width: 263.w,
                        child: OutlinedButton(
                          onPressed: () {
                            if (_image != null) {
                              upload(_image!);
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text(
                                  'All fields required ...',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                                backgroundColor: Color(0xfa8f7805),
                              ));

                              throw 'choose image';
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
                      sbh30,
                    ]),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
