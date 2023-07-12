import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sc_01/widgets/textbutton.dart';
import 'package:sc_01/widgets/textfield.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import '../../../CONNECTION/connection.dart';
import '../../../SharedpreferenceUse/spUse.dart';
import '../../../widgets/sizedbox.dart';
import 'package:intl/intl.dart';

class ReportPetMissingPage extends StatefulWidget {
  const ReportPetMissingPage({Key? key}) : super(key: key);

  @override
  State<ReportPetMissingPage> createState() => _ReportPetMissingPageState();
}

class _ReportPetMissingPageState extends State<ReportPetMissingPage> {
  var lid;
  @override
  void initState() {
    super.initState();
    SharedPreferencesHelper.getSavedData().then((value) {
      setState(() {
        lid = value;
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

  File? _image;
  final picker = ImagePicker();
  List animals = ['Dog', 'Cat', 'Other'];
  String? animalType;
  TextEditingController name = TextEditingController();
  TextEditingController breed = TextEditingController();
  TextEditingController color = TextEditingController();
  TextEditingController contact = TextEditingController();
  TextEditingController health = TextEditingController();
  TextEditingController lastSeenAt = TextEditingController();
  TextEditingController lastSeenOn = TextEditingController();

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
    print(name.text);
    print(breed.text);
    print(color.text);
    print(contact.text);
    print(health.text);
    print(lastSeenAt.text);
    print(lastSeenOn.text);
    var uri = Uri.parse("${Con.url}missing.php");

    var request = http.MultipartRequest("POST", uri);
    request.fields['name'] = name.text;
    request.fields['breed'] = breed.text;
    request.fields['color'] = color.text;
    request.fields['contact'] = contact.text;

    request.fields['health'] = health.text;
    request.fields['lastSeenAt'] = lastSeenAt.text;
    request.fields['lastSeenOn'] = lastSeenOn.text;
    request.fields['user_id'] = lid.toString();
    request.fields['animalType'] = animalType!;
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
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 122.h,
        title: Text('REPORT PET MISSING'),
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
          child: Column(
            children: [
              //profile pic
              Container(
                height: 300.h,
                width: 300.w,
                //  color: Colors.amber,
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
                                height: 200,
                                width: 250,
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
                            right: 80.w,
                            top: 180.w,
                            child: Container(
                              height: 50.w,
                              width: 50.w,
                              //   color: Colors.blueGrey[100],
                              // color: Colors.green,
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                        underline: Container(),
                        isExpanded: true,
                        hint: const Text('--Select Category--'),
                        value: animalType,
                        items: animals
                            .map((e) => DropdownMenuItem(
                                  value: e,
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Text(e),
                                  ),
                                ))
                            .toList(),
                        onChanged: (val) {
                          animalType = val as String?;
                        }),
                  ),
                ),
              ),

              getTextField(
                  "Pet's name",
                  controller: name,
                  Colors.black,
                  15.sp,
                  Colors.black,
                  20.0.w,
                  10.0.h,
                  50.r),
              sbh10,
              getTextField(
                  "Breed",
                  controller: breed,
                  Colors.black,
                  15.sp,
                  Colors.black,
                  20.0.w,
                  10.0.h,
                  50.r),
              sbh10,

              getTextField(
                  "Color",
                  controller: color,
                  Colors.black,
                  15.sp,
                  Colors.black,
                  20.0.w,
                  10.0.h,
                  50.r),
              sbh10,

              getTextField(
                  "Health Condition",
                  controller: health,
                  Colors.black,
                  15.sp,
                  Colors.black,
                  20.0.w,
                  10.0.h,
                  50.r),
              sbh10,
              getTextField(
                  "Last Seen At ",
                  controller: lastSeenAt,
                  Colors.black,
                  15.sp,
                  Colors.black,
                  20.0.w,
                  10.0.h,
                  50.r),
              sbh10,

              getTextField(
                  "Missing Date",
                  controller: lastSeenOn,
                  Colors.black,
                  15.sp,
                  Colors.black,
                  20.0.w,
                  10.0.h,
                  50.r,
                  callback: pickDate),
              sbh10,

              getTextField(
                  "Contact No.",
                  controller: contact,
                  Colors.black,
                  15.sp,
                  Colors.black,
                  20.0.w,
                  10.0.h,
                  50.r),
              sbh30,

              textbutton(263.w, 66.h, Colors.green, 50.r, 'submit', 20.sp,
                  FontWeight.w600, callback: () {
                print('inside callback function');
                if (_image != null) {
                  print('inside callback function,found image not null...');
                  upload(_image!);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text(
                      'All fields required ...',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    backgroundColor: Color(0xfa8f7805),
                  ));

                  throw 'choose image';
                }
              }),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> pickDate() async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now().subtract(Duration(days: 100)),
        // firstDate: DateTime(1950),
        //DateTime.now() - not to allow to choose before today.
        lastDate: DateTime(2100));

    if (pickedDate != null) {
      print(pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      print(
          formattedDate); //formatted date output using intl package =>  2021-03-16
      setState(() {
        lastSeenOn.text = formattedDate; //set output date to TextField value.
      });
    } else {}
  }
}
