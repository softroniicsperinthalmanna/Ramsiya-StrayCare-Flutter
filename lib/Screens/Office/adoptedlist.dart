import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../../CONNECTION/connection.dart';
import '../../SharedpreferenceUse/spUse.dart';
import 'adoptedDetailPage.dart';
import 'collectedindividual.dart';

class AdoptedList extends StatefulWidget {
  AdoptedList({Key? key, required this.lid}) : super(key: key);
  var lid;
  @override
  State<AdoptedList> createState() => _AdoptedListState();
}

class _AdoptedListState extends State<AdoptedList> {
  var reason = TextEditingController();
  var flag = 0;
  var animalID;

  Future<void> _refresh() async {
    // Simulate a delay for fetching new data
    await Future.delayed(Duration(seconds: 2));
    setState(() {});
  }

  Future getData() async {
    var data = {
      // 'officeId': '1'
      'officeId': widget.lid
    };

    var response =
        await http.post(Uri.parse("${Con.url}viewAdoptedList.php"), body: data);
    print(response.body);
    if (jsonDecode(response.body)[0]['result'] == 'success') {
      flag = 1;
      print('Flag:$flag');
      return jsonDecode(response.body);
    } else {
      flag = 0;
      print('Flag:$flag');
      throw Exception(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();

    setState(() {
      getData();
      print('inside adoptHome: ${widget.lid}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: SingleChildScrollView(
            child: RefreshIndicator(
              onRefresh: _refresh,
              child: Column(
                children: [
                  // Padding(
                  //   padding: const EdgeInsets.only(left:20,top:5.0,right: 20,bottom: 10),
                  //   child: Container(
                  //     height: 45,
                  //     decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(20)
                  //     ),
                  //     // child: TextFormField(
                  //     //   decoration:InputDecoration(
                  //     //     hintText: "Search",
                  //     //     hintStyle: TextStyle(color: Color(0xff9088E4)),
                  //     //     prefixIcon: Icon(Icons.search),
                  //     //     enabledBorder: OutlineInputBorder(
                  //     //         borderRadius: BorderRadius.circular(20),
                  //     //         borderSide: BorderSide(
                  //     //             color: Color(0xff9088E4)
                  //     //         )
                  //     //     ),
                  //     //     focusedBorder: OutlineInputBorder(
                  //     //         borderRadius: BorderRadius.circular(20),
                  //     //
                  //     //         borderSide: BorderSide(
                  //     //             color: Color(0xff9088E4)
                  //     //         )
                  //     //
                  //     //     ),
                  //     //
                  //     //   ),
                  //     // ),
                  //   ),
                  // ),
                  Container(
                    height: 700,
                    child: FutureBuilder(
                      future: getData(),
                      builder: (context, snapshot) {
                        print(snapshot.hasData);
                        if (snapshot.hasError) print(snapshot.error);
                        return snapshot.hasData
                            ? GridView.builder(
                                itemCount: snapshot.data.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
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
                                      print(list[index]['animaltype']);
                                      print(list[index]['description']);
                                      print(list[index]['gender']);
                                      print(list[index]['animalId']);
                                      print(list[index]['color']);
                                      print(list[index]['adoptedOn']);
                                      print(list[index]['status']);
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  AdoptedDetailPage(
                                                    adoptedOn: list[index]
                                                        ['adoptedOn'],
                                                    image: list[index]['image'],
                                                    type: list[index]
                                                        ['animaltype'],
                                                    desc: list[index]
                                                        ['description'],
                                                    gender: list[index]
                                                        ['gender'],
                                                    reqID: list[index]['reqId'],
                                                    animalID: list[index]
                                                        ['animalId'],
                                                    breed: list[index]['breed'],
                                                    color: list[index]['color'],
                                                    userID: list[index]
                                                        ['userId'],
                                                    place: list[index]['place'],
                                                    adoptedBy: list[index]
                                                        ['adoptedBy'],
                                                    phone: list[index]['phone'],
                                                  )));
                                    },
                                    child: Hero(
                                      tag: index,
                                      child: Card(
                                          // generate blues with random shades
                                          // color: Colors
                                          //     .purple[Random().nextInt(2) * 100],
                                          child: Padding(
                                        padding: const EdgeInsets.all(12),
                                        child: Container(
                                          height: 250,
                                          child: Column(
                                            children: [
                                              Container(
                                                height: 240,
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                child: Image.network(
                                                  "${Con.url}reportCase/${list[index]['image']}",
                                                  fit: BoxFit.fill,
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
                                                        "#${list[index]['animalId']}",
                                                        // style: normalTextPlay
                                                      ),
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
                            : Center(child: Text('Nothing to show'));
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
