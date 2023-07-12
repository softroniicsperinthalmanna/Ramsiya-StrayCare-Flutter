// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:image_picker/image_picker.dart';
//
// import '../../CONNECTION/connection.dart';
// import '../../widgets/sizedbox.dart';
// import 'package:http/http.dart' as http;
//
// import '../../widgets/textfield.dart';
//
// class CreateCollectionList extends StatefulWidget {
//   const CreateCollectionList({Key? key}) : super(key: key);
//
//   @override
//   State<CreateCollectionList> createState() => _CreateCollectionListState();
// }
//
// class _CreateCollectionListState extends State<CreateCollectionList> {
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   File? _image;
//   final picker = ImagePicker();
//   var gender;
//   TextEditingController description = TextEditingController();
//   TextEditingController animalType = TextEditingController();
//   TextEditingController animalColor = TextEditingController();
//   TextEditingController breed = TextEditingController();
//   TextEditingController collectedOn = TextEditingController();
//   TextEditingController health = TextEditingController();
//
//
//   //TextEditingController mapLocation = TextEditingController();
//
//   Future chooseImage() async {
//     print('choosing image');
//     final pickedImage = await picker.pickImage(source: ImageSource.gallery);
//     setState(() {
//       _image = File(pickedImage!.path);
//     });
//   }
//
//   Future upload(File imageFile) async {
//     //print(name.text);
//     print('trying to upload');
//     print('$imageFile');
//     print(description.text);
//
//
//     //   print(category);
//
//     //var stream = http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
//     //var length = await imageFile.length();
//     var uri = Uri.parse("${Con.url}createCollection.php");
//
//     var request = http.MultipartRequest("POST", uri);
//     request.fields['officeId'] = '1';
//     request.fields['description'] = description.text;
//     request.fields['gender'] = gender;
//     request.fields['animalType'] = animalType.text;
//     request.fields['animalColor'] = animalColor.text;
//     request.fields['breed'] = breed.text;
//     request.fields['collectedOn'] = collectedOn.text;
//     request.fields['health'] = collectedOn.text;
//
//     var pic = await http.MultipartFile.fromPath("image", imageFile.path);
//     //var pic = http.MultipartFile("image",stream,length,filename: basename(imageFile.path));
//
//     request.files.add(pic);
//     var response = await request.send();
//     print(response.statusCode);
//
//
//     if (response.statusCode == 200) {
//
//       //  upload(_image!);
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text(
//           'Adding ...',
//           style:
//           TextStyle(fontSize: 20, color: Colors.white),
//         ),
//         backgroundColor: Color(0xfa8f7805),
//       ));
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text(
//           'Added Successfully ...',
//           style: TextStyle(fontSize: 20, color: Colors.white),
//         ),
//         backgroundColor: Color(0xfa8f7805),
//       ));
//
//       Navigator.pop(context);
//       print("image uploaded");
//     } else {
//       print("uploaded failed");
//     }
//   }
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Container(
//           height: MediaQuery.of(context).size.height,
//           width: MediaQuery.of(context).size.width,
//           decoration: BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage(
//                   'assets/images/lightbg.png',
//                 ),
//                 fit: BoxFit.fill,
//               )),
//
//           child: SingleChildScrollView(
//         child: Column(children: [
//         sbh30,
//             //profile pic
//             Container(
//               height: 300.h,
//               width: 300.w,
//               color: Colors.black26,
//               // child: Image.asset('assets/images/Ellipse 7.png'),
//
//               child:  _image == null
//                   ? Stack(children: [
//                 Center(
//                   child: InkWell(
//                     onTap: () {
//                       upload(_image!);
//                     },
//                     child: Card(
//                       elevation: 5,
//                       child: Container(
//                         color: Color(0xff535252),
//                         height: 300.h,
//                         width: 300.w,
//                         child: const Center(
//                             child: Text(
//                               '-- Click to select image --',
//                               //  style: normalTextPlay,
//                             )),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                     left: 130.w,
//                     top: 130.w,
//                     child: Container(
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         color: Color(0xFF20614A),
//                       ),
//                       height: 50.w,
//                       width: 50.w,
//                       //   color: Colors.blueGrey[100],
//
//                       child: IconButton(
//                         icon: Icon(
//                           Icons.photo_camera_back_outlined,
//                           size: 30.w,
//                           color: Colors.black26,
//                         ),
//                         onPressed: () {
//                           chooseImage();
//                         },
//                       ),
//                     ))
//               ])
//                   : Image.file(_image!),
//
//
//             ),
//
//
//             //description section
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 30.w,vertical: 30.w),
//               child: textformfield(contentColor:Colors.white, controller: description, hint:'Add a Description.....',fcolor: Colors.white,fsize: 12.sp,bordercolor: Colors.white,hpad: 20.w,vpad: 30.h,radius: 0.0,fillcolor: Colors.white,border_style:BorderStyle.solid),
//             ),  Padding(
//               padding: EdgeInsets.symmetric(horizontal: 30.w,vertical: 30.w),
//               child: textformfield(contentColor:Colors.white, controller: description, hint:'Add a Description.....',fcolor: Colors.white,fsize: 12.sp,bordercolor: Colors.white,hpad: 20.w,vpad: 30.h,radius: 0.0,fillcolor: Colors.white,border_style:BorderStyle.solid),
//             ),
//
//
//
//
//             //Location
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 30.w,),
//               // child: textfield('Location', Colors.black, 20.sp,  Colors.transparent, 30.w, 15.h, 5.0.r, const Color(0xFFD9D9D9)),
//               // child: textfield('Location', Colors.black, 20.sp,  Colors.transparent, 30.w, 15.h, 5.0.r, const Color(0xFFD9D9D9)),
//             ),
//
//             sbh30,
//             //submit button
//             SizedBox(
//               height: 66.h,
//               width: 263.w,
//               child: OutlinedButton(
//                 onPressed: () {
//
//                   if (_image != null ) {
//
//                     upload(_image!);
//
//                   } else {
//                     ScaffoldMessenger.of(context)
//                         .showSnackBar(const SnackBar(
//                       content: Text(
//                         'All fields required ...',
//                         style:
//                         TextStyle(fontSize: 20, color: Colors.white),
//                       ),
//                       backgroundColor: Color(0xfa8f7805),
//                     ));
//
//                     throw 'choose image';
//                   }
//                 },
//                 style: OutlinedButton.styleFrom(
//                     backgroundColor: Color(0xFF20614A),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(50.r),
//                     )),
//                 child: Text(
//                   'submit',
//                   style: TextStyle(
//                     color: Color(0xFFFFFFFF),
//                     fontWeight: FontWeight.w600,
//                     fontSize: 20.sp,
//                   ),
//                 ),
//               ),
//             ),
//             sbh30,
//             ]),
//       ),
//         ),
//       ),
//     );
//   }
// }