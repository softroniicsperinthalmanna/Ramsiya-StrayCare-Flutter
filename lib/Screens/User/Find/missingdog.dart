import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../CONNECTION/connection.dart';
import 'missingDetails.dart';

class MissingDogsPage extends StatefulWidget {
  MissingDogsPage({Key? key, required this.missingCategory}) : super(key: key);
  var missingCategory;
  @override
  State<MissingDogsPage> createState() => _MissingDogsPageState();
}

class _MissingDogsPageState extends State<MissingDogsPage> {
  int flag = 0;
  String? cType;

  Future<dynamic> getData() async {
    var data = {'animalType': cType};

    print('inside getData');
    var response =
        await http.post(Uri.parse("${Con.url}viewMissing.php"), body: data);
    print(response.body);
    print(response.statusCode);
    jsonDecode(response.body)[0]['result'] == 'success' ? flag = 1 : flag = 0;

    return jsonDecode(response.body);
  }

  @override
  void initState() {
    super.initState();
    print('inside init state');
    print('category:${widget.missingCategory}');
    switch (widget.missingCategory) {
      case 'DOGS':
        cType = 'Dog';
        break;
      case 'CATS':
        cType = 'Cat';
        break;
      case 'OTHER':
        cType = 'Other';
        break;
    }
    print(cType);
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Color(0xFFFFCE56),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.menu,
                        size: MediaQuery.of(context).size.width * 0.1,
                      ),
                      SizedBox(
                        width: 146.w,
                      ),
                      Image.asset(
                        'assets/images/Rectangle_28-removebg-preview.png',
                        height: 136.h,
                        width: 111.w,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 30.0.h, top: 30.h),
                  child: Container(
                    height: 75.h,
                    width: 263.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(39.r),
                      color: const Color(0xFFCE3434).withOpacity(0.4),
                    ),
                    child: Center(
                      child: Text(
                        widget.missingCategory,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20.sp,
                          color: const Color(0xFFFFFFFF),
                        ),
                      ),
                    ),
                  ),
                ),

                //search bar
                // Container(
                //   height: 53.h,
                //   width: 310.w,
                //   decoration: BoxDecoration(
                //     color: Color(0XFFFFFFFF).withOpacity(0.45),
                //     borderRadius: BorderRadius.circular(8.r),
                //   ),
                //   child: Padding(
                //     padding:
                //         EdgeInsets.symmetric(horizontal: 25.w, vertical: 10.h),
                //     child: Row(
                //       children: [
                //         Text(
                //           'search',
                //           style: TextStyle(
                //             color: Color(0xFFBDC3C7),
                //             fontWeight: FontWeight.w600,
                //             fontSize: 20.sp,
                //           ),
                //         ),
                //         SizedBox(width: 150.w),
                //         Icon(
                //           Icons.search,
                //           size: MediaQuery.of(context).size.width * 0.09,
                //         )
                //       ],
                //     ),
                //   ),
                // ),
                SizedBox(
                  height: 600.h,
                  child: FutureBuilder(
                      future: getData(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        return ListView.builder(
                          itemCount:
                              snapshot.data != null ? snapshot.data.length : 0,
                          itemBuilder: (context, index) {
                            if (snapshot.hasError)
                              print('ERROR-------${snapshot.error}');
                            if (!snapshot.hasData ||
                                snapshot.data.length == 0) {
                              return Center(
                                child: Text('No data found ...'),
                              );
                            }

                            if (flag == 1) {
                              return Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: GestureDetector(
                                  onTap: () {
                                    print(snapshot.data[index]['name']);
                                    print(snapshot.data[index]['animal_type']);
                                    print(snapshot.data[index]['health_cond']);
                                    print(snapshot.data[index]['gender']);
                                    print(snapshot.data[index]['lastseen_at']);
                                    print(snapshot.data[index]['color']);
                                    print(snapshot.data[index]['lastseen_on']);
                                    print(snapshot.data[index]['report_date']);

                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                MissingDetailPage(
                                                  image: snapshot.data[index]
                                                      ['image'],
                                                  name: snapshot.data[index]
                                                      ['name'],
                                                  animal: snapshot.data[index]
                                                      ['animal_type'],
                                                  health: snapshot.data[index]
                                                      ['health_cond'],
                                                  mob: snapshot.data[index]
                                                      ['mob_no'],
                                                  loc: snapshot.data[index]
                                                      ['lastseen_at'],
                                                  breed: snapshot.data[index]
                                                      ['breed'],
                                                  color: snapshot.data[index]
                                                      ['color'],
                                                  miss_date:
                                                      snapshot.data[index]
                                                          ['lastseen_on'],
                                                  report_date:
                                                      snapshot.data[index]
                                                          ['report_date'],
                                                  missing_id:
                                                      snapshot.data[index]
                                                          ['missing_id'],
                                                )));
                                  },
                                  child: Container(
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 104.h,
                                          width: 120.w,
                                          child: Image.network(
                                            '${Con.url}missings/${snapshot.data[index]['image']}',
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Container(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                  '${snapshot.data![index]['name'].toUpperCase()}'),
                                              Text(
                                                  'Breed: ${snapshot.data[index]['breed']}'),
                                              Text(
                                                  'Reported On: ${snapshot.data[index]['report_date']}')
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                                // child: ListTile(
                                //   tileColor: Colors.red,
                                //   leading: Container(
                                //     height: 104.h,
                                //     width: 120.w,
                                //     child: Image.network(
                                //       '${Con.url}missings/${snapshot.data[index]['image']}',
                                //       fit: BoxFit.fill,
                                //     ),
                                //   ),
                                //   title:
                                //       Text('${snapshot.data![index]['name']}'),
                                //   subtitle: Container(
                                //     height: 104.h,
                                //     width: 120.w,
                                //     child: Column(
                                //       mainAxisAlignment:
                                //           MainAxisAlignment.start,
                                //       crossAxisAlignment:
                                //           CrossAxisAlignment.start,
                                //       children: [
                                //         Text(
                                //             'Breed: ${snapshot.data[index]['breed']}'),
                                //         Text(
                                //             'Reported On: ${snapshot.data[index]['report_date']}')
                                //       ],
                                //     ),
                                //   ),
                                //   trailing: Icon(Icons.arrow_forward_ios),
                                // ),
                              );
                            } else {
                              return Center(child: CircularProgressIndicator());
                            }
                          },
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
