import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'dart:io';

import '../../CONNECTION/connection.dart';
import '../../SharedpreferenceUse/spUse.dart';
import '../../style/style.dart';

class CreateCollectionList extends StatefulWidget {
  CreateCollectionList({Key? key}) : super(key: key);
  // var uid;

  @override
  _CreateCollectionListState createState() => _CreateCollectionListState();
}

class _CreateCollectionListState extends State<CreateCollectionList> {
  var lid;
  @override
  void initState() {
    super.initState();
    //  myLogin();
    SharedPreferencesHelper.getSavedData().then((value) {
      setState(() {
        lid = value;
      });
    });
  }

  // Future<void> myLogin() async {
  //   lid = await getSavedData();
  //   print('LoginID:$lid');
  // }

  File? _image;
  final picker = ImagePicker();

  TextEditingController description = TextEditingController();
  TextEditingController collectedOn = TextEditingController();
  TextEditingController animalColor = TextEditingController();
  TextEditingController animalType = TextEditingController();
  TextEditingController breed = TextEditingController();
  var gender;

  Future choiceImage() async {
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = File(pickedImage!.path);
    });
  }

  String? selectedCollection;
  List collectedFrom = ['Veterinary', 'Stray'];
  Future upload(File imageFile) async {
    print('inside uploading fun');

    //var stream = http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
    //var length = await imageFile.length();
    var uri = Uri.parse("${Con.url}collected.php");

    var request = http.MultipartRequest("POST", uri);
    // request.fields['bookName'] = name.text;
    request.fields['office_id'] = lid.toString();
    //  request.fields['officeId'] = widget.uid;
    request.fields['description'] = description.text;
    request.fields['gender'] = gender;
    request.fields['animal_type'] = animalType.text;
    request.fields['animal_color'] = animalColor.text;
    request.fields['breed'] = breed.text;
    request.fields['collected_on'] = collectedOn.text;
    request.fields['collected_from'] = selectedCollection!;

    var pic = await http.MultipartFile.fromPath("image", imageFile.path);
    //var pic = http.MultipartFile("image",stream,length,filename: basename(imageFile.path));

    request.files.add(pic);

    print(description.text);
    print(gender);
    print(animalType.text);
    print(animalColor.text);
    print(breed.text);
    print(collectedOn.text);
    print(selectedCollection);
    print(pic);

    var response = await request.send();

    if (response.statusCode == 200) {
      print("image uploaded");
    } else {
      print("uploaded failed");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          shadowColor: amb,
          title: Text(
            'Add Collected Animals',
            style: GoogleFonts.poppins(
                color: amb, fontSize: 25, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: ListView(
            children: <Widget>[
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 300,
                  //     child: _image == null ? Text('No image selected') : Image.file(_image!),
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
                              right: 80,
                              top: 180,
                              child: ClipOval(
                                  child: Container(
                                height: 50,
                                width: 50,
                                color: Colors.blueGrey[100],
                                child: IconButton(
                                  icon: const Icon(
                                    Icons.photo_camera_back_outlined,
                                    size: 30,
                                    color: Colors.red,
                                  ),
                                  onPressed: () {
                                    choiceImage();
                                  },
                                ),
                              )))
                        ])
                      : Image.file(_image!),
                ),
              ),

              const SizedBox(
                height: 10,
              ),
              TextFormField(
                textAlign: TextAlign.center,
                controller: description,
                keyboardType: TextInputType.text,
                maxLines: 5,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.description_outlined),
                  enabledBorder:
                      OutlineInputBorder(borderSide: BorderSide(color: amb)),
                  focusedBorder:
                      OutlineInputBorder(borderSide: BorderSide(color: amb)),
                  label: const Text(
                    'Add Description',
                    //   style: normalTextPlay,
                  ),
                ),
              ),

              const SizedBox(
                height: 10,
              ),
              Container(
                height: 70,
                child: Row(
                  children: [
                    Expanded(
                      child: RadioListTile(
                          title: const Text(
                            'Male',
                            //     style: normalTextPlay,
                          ),
                          value: 'male',
                          groupValue: gender,
                          onChanged: (val) {
                            setState(() {
                              gender = val;
                            });
                          }),
                    ),
                    Expanded(
                      child: RadioListTile(
                          title: const Text(
                            'Female', // style: normalTextPlay,
                          ),
                          value: 'female',
                          groupValue: gender,
                          onChanged: (val) {
                            setState(() {
                              gender = val;
                            });
                          }),
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: amb),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                      isExpanded: true,
                      hint: Text('  --Select Collection Type--'),
                      value: selectedCollection,
                      items: collectedFrom
                          .map((e) => DropdownMenuItem(
                                child: Padding(
                                  padding: EdgeInsets.only(left: 15.0),
                                  child: Text(e),
                                ),
                                value: e,
                              ))
                          .toList(),
                      onChanged: (val) {
                        setState(() {
                          selectedCollection = val as String?;
                        });
                      }),
                ),
              ),

              const SizedBox(
                height: 10,
              ),

              TextFormField(
                controller: collectedOn,
                //editing controller of this TextField
                decoration: InputDecoration(
                  label: const Text(
                    'Collected On',
                    // style: normalTextPlay,
                  ),
                  enabledBorder:
                      OutlineInputBorder(borderSide: BorderSide(color: amb)),
                  focusedBorder:
                      OutlineInputBorder(borderSide: BorderSide(color: amb)),

                  prefixIcon:
                      const Icon(Icons.calendar_today), //icon of text field
                ),
                //readOnly: true,
                //set it true, so that user will not able to edit text
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate:
                          DateTime.now().subtract(const Duration(days: 100)),
                      // firstDate: DateTime(1950),
                      //DateTime.now() - not to allow to choose before today.
                      lastDate: DateTime(2100));

                  if (pickedDate != null) {
                    print(
                        pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                    String formattedDate =
                        DateFormat('yyyy-MM-dd').format(pickedDate);
                    print(
                        formattedDate); //formatted date output using intl package =>  2021-03-16
                    setState(() {
                      collectedOn.text =
                          formattedDate; //set output date to TextField value.
                    });
                  } else {}
                },
              ),

              const SizedBox(
                height: 10,
              ),

              TextFormField(
                controller: animalType,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.pets_outlined),
                  enabledBorder:
                      OutlineInputBorder(borderSide: BorderSide(color: amb)),
                  focusedBorder:
                      OutlineInputBorder(borderSide: BorderSide(color: amb)),
                  label: const Text(
                    'Animal',
                    //    style: normalTextPlay,
                  ),
                ),
              ),

              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: animalColor,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.color_lens_outlined),
                  enabledBorder:
                      OutlineInputBorder(borderSide: BorderSide(color: amb)),
                  focusedBorder:
                      OutlineInputBorder(borderSide: BorderSide(color: amb)),
                  label: const Text(
                    'Color',
                    //style: normalTextPlay,
                  ),
                ),
              ),

              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: breed,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.type_specimen_outlined),
                  enabledBorder:
                      OutlineInputBorder(borderSide: BorderSide(color: amb)),
                  focusedBorder:
                      OutlineInputBorder(borderSide: BorderSide(color: amb)),
                  label: const Text(
                    'Breed',
                    // style: normalTextPlay,
                  ),
                ),
              ),

              const SizedBox(
                height: 10,
              ),
              Align(
                alignment: AlignmentDirectional.bottomEnd,
                child: Container(
                  width: 200,
                  height: 55,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: amb,
                      ),
                      // side: BorderSide(color: vio)),
                      onPressed: () {
                        if (_image != null) {
                          upload(_image!);
                          //  upload(_image!);
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text(
                              'Adding ...',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                            backgroundColor: Color(0xfa8f7805),
                          ));
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text(
                              'Added Successfully ...',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                            backgroundColor: Color(0xfa8f7805),
                          ));

                          Navigator.pop(context);
                        } else {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text(
                              'All fields required ...',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                            backgroundColor: Color(0xfa8f7805),
                          ));

                          throw 'choose image';
                        }
                      },
                      child: const Center(
                        child: Text(
                          'Add',
                          //  style: btnHeadPlay,
                        ),
                      )),
                ),
              ),
              const SizedBox(
                height: 10,
              ),

              // ElevatedButton(child: Text('Upload Image'),
              //   onPressed: (){
              //     upload(_image!);
              //   },),
            ],
          ),
        ),
      ),
    );
  }
}
