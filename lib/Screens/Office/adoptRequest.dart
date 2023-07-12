import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../CONNECTION/connection.dart';
import '../../SharedpreferenceUse/spUse.dart';

class ToAdoptRequests extends StatefulWidget {
  ToAdoptRequests({Key? key, required this.lid}) : super(key: key);
  var lid;
  @override
  State<ToAdoptRequests> createState() => _ToAdoptRequestsState();
}

class _ToAdoptRequestsState extends State<ToAdoptRequests> {
  var requestId;
  var reply;

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
    var response = await http.post(Uri.parse("${Con.url}viewAdoptRequest.php"),
        body: data);
    print(response.body);
    if (json.decode(response.body)[0]['result'] == 'failed') {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('No request found...')));
    } else {
      // throw Exception('Failed to load data!');
      return json.decode(response.body);
    }
  }

  Future updateRequest() async {
    var data = {
      'requestId': requestId.toString(),
      'replyDate': DateTime.now().toString(),
      'reply': reply
    };
    var response =
        await http.post(Uri.parse("${Con.url}updateRequest.php"), body: data);
    print(response.body);

    return json.decode(response.body);
  }

  @override
  void initState() {
    super.initState();

    setState(() {
      getData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: RefreshIndicator(
          onRefresh: _refresh,
          child: FutureBuilder(
            future: getData(),
            builder: (context, snapshot) {
              if (snapshot.hasError) print('Snapshot Error:${snapshot.error}');

              return (snapshot.hasData)
                  ? ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        List list = snapshot.data;

                        return ListView(
                          shrinkWrap: true,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: ListTile(
                                leading: Container(
                                  height: 100,
                                  width: 80,
                                  decoration: BoxDecoration(
                                      color: Colors.teal,
                                      image: DecorationImage(
                                          image: NetworkImage(
                                            "${Con.url}reportCase/${list[index]['image']}",
                                          ),
                                          fit: BoxFit.fill)),
                                ),
                                title: Text(
                                    'Animal ID: #${list[index]['animalId'].toString()}'),
                                subtitle: Text(
                                    'User ID: #${list[index]['userId'].toString()}'),
                              ),
                            ),
                            ButtonBar(
                              children: [
                                OutlinedButton(
                                    onPressed: () {
                                      requestId = list[index]['reqId'];
                                      print('request Id:$requestId');
                                      print(
                                          'animalId: ${list[index]['animalId'].toString()}');

                                      reply = 'accepted';

                                      setState(() {
                                        updateRequest();
                                      });
                                    },
                                    child: Text('Accept')),
                                OutlinedButton(
                                    onPressed: () {
                                      requestId = list[index]['reqId'];
                                      print('request Id:$requestId');
                                      print(
                                          'animalId: ${list[index]['animalId'].toString()}');
                                      reply = 'declined';

                                      setState(() {
                                        updateRequest();
                                      });
                                    },
                                    child: Text('Decline')),
                              ],
                            )
                          ],
                        );
                      })
                  : Center(
                      child: Text('No Request Found'),
                    );
            },
          ),
        ),
      ),
    );
  }
}
