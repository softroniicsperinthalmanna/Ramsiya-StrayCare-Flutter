import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Auth/signincatogories.dart';
import '../../CONNECTION/connection.dart';
import '../../Location/map.dart';

class ViewWildCase extends StatefulWidget {
  const ViewWildCase({Key? key}) : super(key: key);

  @override
  State<ViewWildCase> createState() => _ViewWildCaseState();
}

class _ViewWildCaseState extends State<ViewWildCase> {
  var flag;
  var _selectedItem;

  Future<dynamic> getData() async {
    var response = await get(Uri.parse('${Con.url}viewWildCase.php'));
    print(response.body);
    var res2 = jsonDecode(response.body)[0]['result'];
    print('result is : $res2');
    res2 == "success" ? flag = 1 : flag = 0;
    return jsonDecode(response.body);
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 135,
          flexibleSpace: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: Text('Do you want to LogOut ?'),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    SharedPreferences.getInstance()
                                        .then((prefs) {
                                      prefs.remove('loginId');
                                    });

                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SigninCatogoriesPage()));
                                  },
                                  child: Text('Yes')),
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('No')),
                            ],
                          );
                        });
                  },
                  icon: Icon(
                    Icons.logout,
                    size: MediaQuery.of(context).size.width * 0.08,
                    color: Color(0xFFFFFFFF),
                  ),
                ),
                //menu icon
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
          )),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage(
              'assets/images/Rectangle 202.png',
            ),
            fit: BoxFit.fill,
          )),
          child: FutureBuilder(
              future: getData(),
              builder: (context, snapshot) {
                if (snapshot.hasError) print('Error:${snapshot.error}');
                print('Inside forest case card: ${snapshot.hasData}');
                if (!snapshot.hasData) {
                  return const Center(
                    child: Text('No Data..'),
                  );
                }

                return flag == 0
                    ? Center(child: Text('Nothing to show'))
                    : Container(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: Expanded(
                          child: ListView.builder(
                              shrinkWrap: true,
                              physics: BouncingScrollPhysics(),
                              itemCount: snapshot.data.length,
                              itemBuilder: (context, index) {
                                var reportedDate =
                                    snapshot.data[index]['reportedOn'];
                                var time = reportedDate != null
                                    ? DateFormat.yMEd()
                                        .add_jms()
                                        .format(DateTime.parse(reportedDate))
                                    : '';

                                return Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Card(
                                    color: Colors.transparent,
                                    elevation: 20,
                                    child: ListView(
                                        shrinkWrap: true,
                                        //  crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 20.0.w,
                                                top: 10.h,
                                                bottom: 5.h),
                                            child: Wrap(
                                              children: [
                                                Icon(
                                                  Icons.person_pin,
                                                  color: Color(0xff8d0909),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  snapshot.data[index]
                                                      ['reporter'],
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 15.sp,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 20.0.w,
                                                top: 5.h,
                                                bottom: 5.h),
                                            child: Wrap(
                                              children: [
                                                Icon(
                                                  Icons.location_on,
                                                  color: Color(0xff8d0909),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    var mapLat;
                                                    mapLat = double.parse(
                                                        snapshot.data[index]
                                                            ['lati']);
                                                    var mapLong;
                                                    mapLong = double.parse(
                                                        snapshot.data[index]
                                                            ['longi']);

                                                    MapUtils.openMap(
                                                        mapLat, mapLong);
                                                  },
                                                  child: Text(
                                                    snapshot.data[index]
                                                        ['location'],
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 10.sp,
                                                      color: Colors.white,

                                                      decoration: TextDecoration
                                                          .underline,
                                                      decorationColor: Colors
                                                          .blue, // Optional: You can set the underline color
                                                      decorationStyle:
                                                          TextDecorationStyle
                                                              .solid, // Optional: You can set the style of the underline (e.g., dotted, dashed)
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),

                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 20.0.w,
                                                top: 5.h,
                                                bottom: 10.h),
                                            child: Wrap(
                                              children: [
                                                Icon(
                                                  Icons.timer_outlined,
                                                  color: Color(0xff8d0909),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  time,
                                                  style: TextStyle(
                                                    //   fontWeight: FontWeight.w600,
                                                    fontSize: 10.sp,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),

                                          Center(
                                            child: Container(
                                              height: 218.h,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              child: Image.network(
                                                "${Con.url}reportCase/${snapshot.data[index]['image']}",
                                                fit: BoxFit.fill,
                                              ),
                                              // decoration: BoxDecoration(
                                              //     image: DecorationImage(
                                              //         image: AssetImage('assets/images/Rectangle 204.png'),
                                              //         fit: BoxFit.fill)),
                                            ),
                                          ),
                                          Center(
                                            child: Container(
                                              height: 138.h,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              color: Color(0xFFD9D9D9)
                                                  .withOpacity(0.51),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  snapshot.data[index]
                                                      ['description'],
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 20.sp,
                                                    color: Colors.white,
                                                  ),
                                                  textAlign: TextAlign.justify,
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10.h,
                                          ),
                                          // Padding(
                                          //   padding: EdgeInsets.symmetric(
                                          //       horizontal: 55.w, vertical: 10.h),
                                          //   child: SizedBox(
                                          //     height: 65.h,
                                          //     width: 243.w,
                                          //     child: TextButton(
                                          //         style: TextButton.styleFrom(
                                          //             backgroundColor: Color(0xFF922020)
                                          //                 .withOpacity(0.42),
                                          //             shape: RoundedRectangleBorder(
                                          //               borderRadius:
                                          //                   BorderRadius.circular(30.r),
                                          //             )),
                                          //         onPressed: () {
                                          //           showDialog(
                                          //               context: context,
                                          //               builder: (context) {
                                          //                 return AlertDialog(
                                          //                   icon: Icon(
                                          //                     Icons.phone,
                                          //                     color: Colors.blue,
                                          //                   ),
                                          //                   content:
                                          //                       Text('Make a Call'),
                                          //                   actions: [
                                          //                     TextButton(
                                          //                         onPressed: () {
                                          //                           Uri launchUri = Uri(
                                          //                               scheme: 'tel',
                                          //                               path: snapshot
                                          //                                           .data![
                                          //                                       index]
                                          //                                   ['phone']);
                                          //                           launchUrl(
                                          //                               launchUri);
                                          //                           Navigator.pop(
                                          //                               context);
                                          //                         },
                                          //                         child: Text('sure')),
                                          //                     TextButton(
                                          //                         onPressed: () {
                                          //                           Navigator.pop(
                                          //                               context);
                                          //                         },
                                          //                         child: Text('cancel'))
                                          //                   ],
                                          //                 );
                                          //               });
                                          //         },
                                          //         child: Text(
                                          //           'Call Reporter',
                                          //           style: TextStyle(
                                          //             fontSize: 20.sp,
                                          //             fontWeight: FontWeight.w600,
                                          //             color: Colors.white,
                                          //           ),
                                          //         )),
                                          //   ),
                                          // ),
                                          // Padding(
                                          //   padding: EdgeInsets.symmetric(
                                          //       horizontal: 55.w, vertical: 10.h),
                                          //   child: SizedBox(
                                          //     height: 65.h,
                                          //     width: 243.w,
                                          //     child: TextButton(
                                          //         style: TextButton.styleFrom(
                                          //             backgroundColor: Color(0xFF922020)
                                          //                 .withOpacity(0.42),
                                          //             shape: RoundedRectangleBorder(
                                          //               borderRadius:
                                          //                   BorderRadius.circular(30.r),
                                          //             )),
                                          //         onPressed: () {},
                                          //         child: Text(
                                          //           'Call Stray care',
                                          //           style: TextStyle(
                                          //             fontSize: 20.sp,
                                          //             fontWeight: FontWeight.w600,
                                          //             color: Colors.white,
                                          //           ),
                                          //         )),
                                          //   ),
                                          // ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              // SizedBox(
                                              //   height: 50.h,
                                              //   width: 265.w,
                                              //   child: TextButton(
                                              //       style: TextButton.styleFrom(
                                              //           backgroundColor: Color(
                                              //                   0xFF2B787A)
                                              //               .withOpacity(0.58),
                                              //           shape:
                                              //               RoundedRectangleBorder(
                                              //             borderRadius:
                                              //                 BorderRadius
                                              //                     .circular(
                                              //                         30.r),
                                              //           )),
                                              //       onPressed: () {},
                                              //       child:
                                              //           // Text(
                                              //           //   'Collected',
                                              //           Text(
                                              //         'Attend',
                                              //         style: TextStyle(
                                              //           fontSize: 20.sp,
                                              //           fontWeight:
                                              //               FontWeight.w600,
                                              //           color: Colors.white,
                                              //         ),
                                              //       )),
                                              // ),
                                              Container(
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    shape: BoxShape.circle),
                                                child: IconButton(
                                                    onPressed: () {
                                                      showModalBottomSheet(
                                                          context: context,
                                                          builder: (context) {
                                                            return Container(
                                                              child: Wrap(
                                                                children: [
                                                                  ListTile(
                                                                    //    leading: Icon(Icons.phone),
                                                                    title: Text(
                                                                        'Call Reporter'),
                                                                    onTap: () {
                                                                      showDialog(
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (context) {
                                                                            return AlertDialog(
                                                                              icon: Icon(
                                                                                Icons.phone,
                                                                                color: Colors.blue,
                                                                              ),
                                                                              content: Text('Make a Call'),
                                                                              actions: [
                                                                                TextButton(
                                                                                    onPressed: () {
                                                                                      Uri launchUri = Uri(scheme: 'tel', path: snapshot.data![index]['phone']);
                                                                                      launchUrl(launchUri);
                                                                                      Navigator.pop(context);
                                                                                    },
                                                                                    child: Text('sure')),
                                                                                TextButton(
                                                                                    onPressed: () {
                                                                                      Navigator.pop(context);
                                                                                    },
                                                                                    child: Text('cancel'))
                                                                              ],
                                                                            );
                                                                          });
                                                                    },
                                                                  ),
                                                                  // ListTile(
                                                                  // //  leading: Icon(Icons.phone),
                                                                  //   title: Text('Call StrayCare Office'),
                                                                  //   onTap: (){},
                                                                  // ),
                                                                ],
                                                              ),
                                                            );
                                                          });
                                                    },
                                                    icon: Icon(Icons.phone)),
                                              )
                                            ],
                                          ),
                                        ]),
                                  ),
                                );
                              }),
                        ),
                      );
              }),
        ),
      ),
    );
  }
}
