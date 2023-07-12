import 'dart:convert';
import 'dart:math';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../../CONNECTION/connection.dart';
import '../../SharedpreferenceUse/spUse.dart';
import '../../style/style.dart';
import 'collectedindividual.dart';
import 'deadDetailPage.dart';

class DeadList extends StatefulWidget {
  DeadList({
    Key? key,
  }) : super(key: key);
  //var uid;
  @override
  State<DeadList> createState() => _DeadListState();
}

class _DeadListState extends State<DeadList> {
  var animalID;
  var lid;

  var flag;
  Future getData() async {
    var data = {
      // 'officeId':'1'
      'officeId': lid.toString()
    };

    var response =
        await http.post(Uri.parse("${Con.url}viewDeadList.php"), body: data);
    print(response.body);
    var res2 = jsonDecode(response.body)[0]['result'];
    print('result is : $res2');
    res2 == "success" ? flag = 1 : flag = 0;
    return jsonDecode(response.body);
  }

  // Future sendDead() async {
  //   var data={
  //
  //     'animalId':animalID.toString(),
  //     'diedOn':DateTime.now().toString()
  //   };
  //
  //   var response = await http.post(Uri.parse("${Con.url}reportDead.php"),body: data);
  //   print(response.body);
  //
  //   return json.decode(response.body);
  //
  // }
  @override
  void initState() {
    super.initState();
    SharedPreferencesHelper.getSavedData().then((value) {
      setState(() {
        lid = value;
      });
    });
    //  print('two:${widget.indexNo}');
    // print('cat inside init:$category');
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: amb,
          elevation: 0,
          title: Text(
            "Dead Cases",
            //  style: TextStyle(color: Colors.white, fontSize: 30),
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
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Padding(
                //   padding: const EdgeInsets.only(left:20,top:5.0,right: 20,bottom: 10),
                //   child: Container(
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
                      print('Inside dead list: ${snapshot.hasData}');
                      if (!snapshot.hasData) {
                        return const Center(
                          child: Text('No Data..'),
                        );
                      }
                      return flag == 0
                          ? Center(child: Text('Nothing to show'))
                          : snapshot.hasData
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
                                        print(list[index]['type']);
                                        print(list[index]['description']);
                                        print(list[index]['gender']);
                                        print(list[index]['location']);
                                        print(list[index]['color']);
                                        print(list[index]['died_on']);
                                        print(list[index]['status']);
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    DeadDetails(
                                                        reason: list[index]
                                                            ['reason'],
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
                                                        diedOn: list[index]
                                                            ['diedOn'],
                                                        loc: list[index]
                                                            ['location'],
                                                        breed: list[index]
                                                            ['breed'],
                                                        color: list[index]
                                                            ['color'])));
                                      },
                                      child: Hero(
                                        tag: index,
                                        child: Card(
                                            // generate blues with random shades
                                            // color: Colors.purple[
                                            //     Random().nextInt(2) * 100],
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
                                                    child: Text(
                                                        list[index]['breed']
                                                            .toUpperCase(),
                                                        style: normalTextPlay),
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
    );
  }
}
