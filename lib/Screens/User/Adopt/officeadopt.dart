import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sc_01/Screens/User/Adopt/toAdoptDetails.dart';

import '../../../CONNECTION/connection.dart';

class OfficeAdoptPage extends StatefulWidget {
  const OfficeAdoptPage({Key? key}) : super(key: key);

  @override
  State<OfficeAdoptPage> createState() => _OfficeAdoptPageState();
}

class _OfficeAdoptPageState extends State<OfficeAdoptPage> {
  var flag;
  Future getData() async {
    var response = await http.get(Uri.parse("${Con.url}viewToAdoptList.php"));
    print(response.body);
    var res2 = jsonDecode(response.body)[0]['result'];
    print('result is : $res2');
    res2 == "success" ? flag = 1 : flag = 0;
    return jsonDecode(response.body);
  }

  @override
  void initState() {
    super.initState();
    //  print('two:${widget.indexNo}');
    // print('cat inside init:$category');
    getData();
  }

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
          child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //search bar
                  // Padding(
                  //   padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 32.h),
                  //   child: Container(
                  //     height: 53.h,
                  //     width: 310.w,
                  //     decoration: BoxDecoration(
                  //         color: Color(0XFFFFFFFF).withOpacity(0.45),
                  //         borderRadius: BorderRadius.circular(8.r),
                  //         border: Border.all(
                  //           color: Colors.black,
                  //         )),
                  //     child: Padding(
                  //       padding:
                  //       EdgeInsets.symmetric(horizontal: 25.w, vertical: 10.h),
                  //       child: Row(
                  //         children: [
                  //           Text(
                  //             'search',
                  //             style: TextStyle(
                  //               color: Color(0xFFBDC3C7),
                  //               fontWeight: FontWeight.w600,
                  //               fontSize: 20.sp,
                  //             ),
                  //           ),
                  //           SizedBox(width: 150.w),
                  //           Icon(
                  //             Icons.search,
                  //             size: MediaQuery.of(context).size.width * 0.09,
                  //           )
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // ),

                  //gridview of images
                  Container(
                    height: MediaQuery.of(context).size.height * 0.8,
                    child: FutureBuilder(
                        future: getData(),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.hasError)
                            print('Error:${snapshot.error}');
                          print('Inside toAdopt list: ${snapshot.hasData}');
                          if (!snapshot.hasData) {
                            return const Center(
                              child: Text('No Data..'),
                            );
                          }
                          return flag == 0
                              ? Center(child: Text('Nothing to show'))
                              : snapshot.hasData
                                  ? Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: GridView.builder(
                                        gridDelegate:
                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          mainAxisSpacing: 4,
                                          crossAxisSpacing: 4,
                                          childAspectRatio: 0.6,
                                        ),
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          List list = snapshot.data;
                                          return InkWell(
                                            onTap: () {
                                              print(list[index]['office']);
                                              print(list[index]['officeID']);
                                              print(list[index]['animalID']);
                                              print(list[index]['description']);
                                              print(list[index]['gender']);
                                              print(list[index]['type']);
                                              print(list[index]['color']);
                                              print(list[index]['breed']);
                                              // print(
                                              //     list[index]['collected_on']);

                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          ToAdoptDetailPage(
                                                            //   uid: widget.uid,
                                                            image: list[index]
                                                                ['image'],
                                                            animal: list[index]
                                                                ['type'],
                                                            desc: list[index]
                                                                ['description'],
                                                            gender: list[index]
                                                                ['gender'],
                                                            loc: list[index]
                                                                ['office'],
                                                            breed: list[index]
                                                                ['breed'],
                                                            color: list[index]
                                                                ['color'],
                                                            animalID: list[
                                                                    index]
                                                                ['animalID'],
                                                            officeId: list[
                                                                    index]
                                                                ['officeID'],
                                                          )));
                                            },
                                            child: Hero(
                                              tag: index,
                                              child: Card(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              35)),
                                                  // generate blues with random shades
                                                  // color: Colors.pink[Random().nextInt(2) * 100],
                                                  color: Colors.white,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10),
                                                    child: Container(
                                                      height: 250,
                                                      // decoration: BoxDecoration(
                                                      //     borderRadius: BorderRadius.circular(50)
                                                      // ),
                                                      child: ListView(
                                                        children: [
                                                          Container(
                                                            height: 235,
                                                            width:
                                                                MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width,
                                                            child:
                                                                Image.network(
                                                              "${Con.url}reportCase/${list[index]['image']}",
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                          Container(
                                                            height: 50,
                                                            color: Colors.white,
                                                            child: Center(
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceEvenly,
                                                                children: [
                                                                  Text(
                                                                    list[index][
                                                                            'breed']
                                                                        .toUpperCase(),
                                                                    //  style: normalTextPlay
                                                                  ),
                                                                  // PopupMenuButton(
                                                                  //     icon:Icon(Icons.more_horiz),
                                                                  //     itemBuilder: (context){
                                                                  //   return [
                                                                  //     PopupMenuItem(child: TextButton(onPressed: (){},child:Text('View Details'))),
                                                                  //     PopupMenuItem(child: TextButton(onPressed: (){
                                                                  //       showDialog(context: context, builder: (context){
                                                                  //         return   AlertDialog(
                                                                  //           content: Text('Are you sure?'),
                                                                  //           icon: Icon(Icons.info_outline,size: 60,color: Colors.amber,),
                                                                  //           actions: [
                                                                  //             TextButton(onPressed: (){
                                                                  //               showDialog(context: context, builder: (context){
                                                                  //                 return     AlertDialog(
                                                                  //                   title: Text('Marked Dead'),
                                                                  //                   icon: Icon(Icons.check_circle_outline,size: 60,color: Colors.green,),
                                                                  //                   actions: [
                                                                  //                     TextButton(onPressed: (){
                                                                  //                       setState(() {
                                                                  //
                                                                  //                       });
                                                                  //                       Navigator.pop(context);
                                                                  //                     }, child: Text("Ok",style: rednormal13,))
                                                                  //                   ],
                                                                  //                 );
                                                                  //
                                                                  //
                                                                  //               });
                                                                  //
                                                                  //             }, child: Text("Mark Dead",style: rednormal13,)),
                                                                  //             TextButton(onPressed: (){}, child: Text("Cancel",style: rednormal13,))
                                                                  //           ],
                                                                  //         );
                                                                  //
                                                                  //
                                                                  //       });
                                                                  //     },child:Text('Mark Dead'))),
                                                                  //
                                                                  //   ];
                                                                  // })
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  )),
                                            ),
                                          );
                                        },
                                        itemCount: snapshot.data.length,
                                      ),
                                    )
                                  : Center(child: CircularProgressIndicator());
                        }),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
