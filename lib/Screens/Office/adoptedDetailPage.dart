import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../CONNECTION/connection.dart';
import '../../style/style.dart';

class AdoptedDetailPage extends StatefulWidget {
  // var name;
  var animalID;
  var desc;
  var gender;
  var type; //office location
  var breed;
  var color;
  var adoptedOn;
  var reqID;
  var image;
  var userID;
  var adoptedBy;
  var place;
  var phone;

  AdoptedDetailPage({
    Key? key,
    required this.adoptedOn,
    required this.reqID,
    required this.image,
    required this.animalID,
    required this.desc,
    required this.gender,
    required this.type,
    required this.breed,
    required this.color,
    required this.userID,
    required this.adoptedBy,
    required this.place,
    required this.phone,
  }) : super(key: key);

  @override
  State<AdoptedDetailPage> createState() => _AdoptedDetailPageState();
}

class _AdoptedDetailPageState extends State<AdoptedDetailPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              Positioned(
                top: 0,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                      image: DecorationImage(
                        image: NetworkImage(
                            '${Con.url}reportCase/${widget.image}'),
                        fit: BoxFit.cover,
                      ),
                      color: amb),
                  height: 330,
                  width: MediaQuery.of(context).size.width,
                  //  child: Image(image: NetworkImage('${Con.url}reportCase/${widget.image}'),fit: BoxFit.cover,)
                  //  ),
                ),
              ),
              Positioned(
                top: 300,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    height: 450,
                    width: 380,
                    decoration: BoxDecoration(
                      color: Colors.black87,
                      border: Border.all(color: Colors.amber, width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    child: DataTable(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      // clipBehavior:Clip.none,
                      columnSpacing: 3,
                      dataRowHeight: 43,

                      //  border: TableBorder.all(color: vio,),
                      columns: [
                        DataColumn(
                            label: Text(
                          'Animal ID ',
                          style: whitenormal13,
                        )),
                        DataColumn(
                            label: Text(
                          ':# ${widget.animalID}',
                          style: whitenormal13,
                        )),
                      ],
                      rows: [
                        DataRow(cells: [
                          DataCell(Text(
                            'Request ID ',
                            style: whitenormal13,
                          )),
                          DataCell(Text(
                            ':# ${widget.reqID}',
                            style: whitenormal13,
                          )),
                        ]),
                        DataRow(cells: [
                          DataCell(Text(
                            'Description ',
                            style: whitenormal13,
                          )),
                          DataCell(Text(
                            ': ${widget.desc}',
                            style: whitenormal13,
                          )),
                        ]),
                        DataRow(cells: [
                          DataCell(Text(
                            'Gender ',
                            style: whitenormal13,
                          )),
                          DataCell(Text(
                            ': ${widget.gender}',
                            style: whitenormal13,
                          )),
                        ]),
                        DataRow(cells: [
                          DataCell(Text(
                            'Animal Type ',
                            style: whitenormal13,
                          )),
                          DataCell(Text(
                            ': ${widget.type}',
                            style: whitenormal13,
                          )),
                        ]),
                        DataRow(cells: [
                          DataCell(Text(
                            'Color ',
                            style: whitenormal13,
                          )),
                          DataCell(Text(
                            ': ${widget.color}',
                            style: whitenormal13,
                          )),
                        ]),
                        DataRow(cells: [
                          DataCell(Text(
                            'Breed ',
                            style: whitenormal13,
                          )),
                          DataCell(Text(
                            ': ${widget.breed}',
                            style: whitenormal13,
                          )),
                        ]),
                        DataRow(cells: [
                          DataCell(Text(
                            'Adopted On ',
                            style: whitenormal13,
                          )),
                          DataCell(Text(
                            ': ${widget.adoptedOn}',
                            style: rednormal13,
                          )),
                        ]),
                        DataRow(cells: [
                          DataCell(Text(
                            'Adopted By ',
                            style: whitenormal13,
                          )),
                          DataCell(
                            TextButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: Text('Adopted User'),
                                        content: Container(
                                          height: 200,
                                          child: Column(
                                            children: [
                                              ListTile(
                                                title: Text(
                                                  widget.adoptedBy,
                                                  style: TextStyle(
                                                      color: Colors.blue,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              ListTile(
                                                leading: Icon(
                                                    Icons.location_on_outlined),
                                                title: Text(widget.place),
                                              ),
                                              ListTile(
                                                leading: Icon(Icons.phone),
                                                title: Text(widget.phone),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    });
                              },
                              child: Text(
                                ':User ID : # ${widget.userID}',
                              ),
                            ),
                          )
                        ]),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        // floatingActionButton: FloatingActionButton(
        //   backgroundColor:Color(0xff9088E4) ,
        //   foregroundColor: Colors.white,
        //   onPressed: (){
        //     Navigator.pop(context);
        //
        //   },
        //   child: Icon(Icons.arrow_back_ios_new,size: 30,),
        // ),
      ),
    );
  }
}
