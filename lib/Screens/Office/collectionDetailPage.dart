import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../CONNECTION/connection.dart';
import '../../style/style.dart';
class CollectionDetailPage extends StatefulWidget {
 // var name;
  var animal;
  var desc;
  var gender;
  var date;//office location
  var breed;
  var color;

 // var miss_date;
 // var report_date;
  var image;
var status;
  CollectionDetailPage({Key? key,required this.image,required this.animal,required this.desc,required this.gender,required this.date,required this.breed,required this.color,required this.status}) : super(key: key);

  @override
  State<CollectionDetailPage> createState() => _CollectionDetailPageState();
}

class _CollectionDetailPageState extends State<CollectionDetailPage> {
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
            children:[
              Positioned(
                top: 0,

                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight:Radius.circular(30),
                    ),
                    image: DecorationImage(
                      image:  NetworkImage('${Con.url}reportCase/${widget.image}'),fit: BoxFit.cover,

                    ),
                    color: amb
                  ),
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
                    height: 320,
                    width:380 ,

                    decoration: BoxDecoration(
                      color: Colors.black87,
                      border: Border.all(
                        color: Colors.amber,
                        width: 1
                      ),
                    borderRadius: BorderRadius.all(Radius.circular(30)),
    ),
                    child:DataTable (
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20))
                      ),
                      // clipBehavior:Clip.none,
                      columnSpacing:3,
                      dataRowHeight:43,

                      //  border: TableBorder.all(color: vio,),
                      columns: [
                        DataColumn(label: Text('Breed',style: whitenormal13,)),
                        DataColumn(label: Text(widget.breed,style: whitenormal13,)),


                      ],
                      rows: [

                        DataRow(cells: [
                          DataCell(Text('Description ',style: whitenormal13,)),
                          DataCell(Text(': ${widget.desc}',style: whitenormal13,)),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('Gender ',style: whitenormal13,)),
                          DataCell(Text(': ${widget.gender}',style: whitenormal13,)),
                        ]),

                        DataRow(cells: [
                          DataCell(Text('Animal Type ',style: whitenormal13,)),
                          DataCell(Text(': ${widget.animal}',style: whitenormal13,)),
                        ]),

                        DataRow(cells: [
                          DataCell(Text('Color ',style: whitenormal13,)),
                          DataCell(Text(': ${widget.color}',style: whitenormal13,)),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('Collected On ',style: whitenormal13,)),
                          DataCell(Text(': ${widget.date}',style: whitenormal13,)),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('Status ',style: whitenormal13,)),
                          DataCell(Text(': ${widget.status}',style: rednormal13,)),
                        ]),





                      ],



                    ),    ),
                ),
              ),

            ],
          ),
        ),

      ),
    );

  }
}
