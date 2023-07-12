import 'dart:convert';
import 'dart:math';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../CONNECTION/connection.dart';
import '../../SharedpreferenceUse/spUse.dart';
import '../../style/style.dart';
import 'collectedindividual.dart';
import 'collectionDetailPage.dart';
import 'createCollectionList.dart';

class Collectedlist extends StatefulWidget {
  Collectedlist({Key? key}) : super(key: key);

  @override
  State<Collectedlist> createState() => _CollectedlistState();
}

class _CollectedlistState extends State<Collectedlist> {
  var flag;
  Future<void> _refresh() async {
    // Call your API or update your data source here
    setState(() {});
  }

  var lid;
  @override
  void initState() {
    super.initState();

    SharedPreferences.getInstance().then((prefs) {
      bool containsLoginId = prefs.containsKey('loginId');
      print(containsLoginId);
      if (containsLoginId) {
        String loginId = prefs.getString('loginId') ?? '';
        print('loginId:$loginId');
        // Value exists, do something with loginId
      } else {
        // Value does not exist
      }
    });

    SharedPreferencesHelper.getSavedData().then((value) {
      setState(() {
        lid = value;
        print('splidGot:$lid');
        getData();
      });
    });
    print('lid:$lid');
    // myLogin();
  }

  // Future<void> myLogin() async {
  //   lid = await getSavedData();
  //   print('LoginID:$lid');
  // }

  Future getData() async {
    var data = {
      'officeId': lid.toString()
      // 'officeId':widget.uid
    };

    var response = await http.post(Uri.parse("${Con.url}viewCollectedList.php"),
        body: data);
    print(response.body);
    var res2 = jsonDecode(response.body)[0]['result'];
    print('result is : $res2');
    if (res2 == "success") {
      flag = 1;
      return jsonDecode(response.body);
    } else
      flag = 0;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: amb,
          elevation: 0,
          // centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(backgroundColor: Colors.white),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CreateCollectionList()));
                },
                child: Text(
                  'Add',
                  style: GoogleFonts.poppins(color: Colors.amber),
                ),
              ),
            ),
          ],

          title: Text(
            "Collected Animals",
            style: GoogleFonts.poppins(
                color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage(
              'assets/images/lightbg.png',
            ),
            fit: BoxFit.fill,
          )),
          child: RefreshIndicator(
            onRefresh: _refresh,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Padding(
                  //   padding: const EdgeInsets.only(left:20,top:5.0,right: 20,bottom: 10),
                  //   child:Container(
                  //     height: 45,
                  //     decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(20)
                  //     ),
                  //     child: TextFormField(
                  //       decoration:InputDecoration(
                  //         hintText: "Search",
                  //         hintStyle: TextStyle(color: Color(0xff9088E4)),
                  //         prefixIcon: Icon(Icons.search),
                  //         enabledBorder: OutlineInputBorder(
                  //             borderRadius: BorderRadius.circular(20),
                  //             borderSide: BorderSide(
                  //                 color: Color(0xff9088E4)
                  //             )
                  //         ),
                  //         focusedBorder: OutlineInputBorder(
                  //             borderRadius: BorderRadius.circular(20),
                  //
                  //             borderSide: BorderSide(
                  //                 color: Color(0xff9088E4)
                  //             )
                  //
                  //         ),
                  //
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  Container(
                    height: 700,
                    child: FutureBuilder(
                      future: getData(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) print('Error:${snapshot.error}');
                        print(lid);
                        print('Inside collection list: ${snapshot.hasData}');
                        if (!snapshot.hasData) {
                          return Center(
                            child: Text(
                              'No Data..',
                              style: normalText,
                            ),
                          );
                        }
                        return flag == 0
                            ? Center(
                                child: Text(
                                'Nothing to show',
                                style: normalText,
                              ))
                            : snapshot.hasData
                                ? GridView.builder(
                                    itemCount: snapshot.data.length,
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 4,
                                      mainAxisSpacing: 4,
                                      childAspectRatio: 0.6,
                                    ),
                                    itemBuilder: (context, index) {
                                      List list = snapshot.data;
                                      return InkWell(
                                        onTap: () {
                                          //print(list[index]['name']);
                                          print(list[index]['type']);
                                          print(list[index]['description']);
                                          print(list[index]['gender']);
                                          print(list[index]['location']);
                                          print(list[index]['color']);
                                          print(list[index]['collected_on']);
                                          print(list[index]['status']);
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      CollectionDetailPage(
                                                          status: list[index]
                                                              ['status'],
                                                          image: list[index]
                                                              ['image'],
                                                          animal: list[index]
                                                              ['type'],
                                                          desc: list[index]
                                                              ['description'],
                                                          gender: list[index]
                                                              ['gender'],
                                                          date: list[index]
                                                              ['date'],
                                                          breed: list[index]
                                                              ['breed'],
                                                          color: list[index]
                                                              ['color'])));
                                        },
                                        child: Hero(
                                          tag: index,
                                          child: Card(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          35)),
                                              color: Colors.white,
                                              // generate blues with random shades
                                              //  color: Colors.purple[Random().nextInt(2) * 100],
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(12),
                                                child: Container(
                                                  height: 250,
                                                  child: Column(
                                                    children: [
                                                      Container(
                                                        height: 240,
                                                        width: MediaQuery.of(
                                                                context)
                                                            .size
                                                            .width,
                                                        child: Image.network(
                                                          "${Con.url}reportCase/${list[index]['image']}",
                                                          fit: BoxFit.cover,
                                                        ),
                                                        // child:
                                                        // Center(
                                                        //   child: Text(
                                                        //     artCatelog[index]['name'],
                                                        //     style: TextStyle(color:Colors.white,
                                                        //         fontWeight: FontWeight.bold,fontSize: 30),),),
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
                                    })
                                : Center(child: CircularProgressIndicator());
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
