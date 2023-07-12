import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../CONNECTION/connection.dart';
import '../../../style/style.dart';

class MissingDetailPage extends StatefulWidget {
  var name;
  var animal;
  var health;
  var mob;
  var loc;
  var breed;
  var color;
  var miss_date;
  var report_date;
  var image;
  var missing_id;

  MissingDetailPage(
      {Key? key,
      required this.name,
      required this.missing_id,
      required this.image,
      required this.animal,
      required this.health,
      required this.mob,
      required this.loc,
      required this.breed,
      required this.color,
      required this.miss_date,
      required this.report_date})
      : super(key: key);

  @override
  State<MissingDetailPage> createState() => _MissingDetailPageState();
}

class _MissingDetailPageState extends State<MissingDetailPage> {
  Future markFound() async {
    var data = {
      'missing_id': widget.missing_id.toString(),
    };

    var response =
        await http.post(Uri.parse("${Con.url}reportFound.php"), body: data);
    print(response.body);
    if (jsonDecode(response.body)['result'] == 'success') {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
              'Found case marked successfully (Animal ID: ${widget.missing_id})...')));
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Process failed...')));
      Navigator.pop(context);
    }
    //  return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ListView(
              children: [
                Center(
                  child: Card(
                    elevation: 5,
                    child: Container(
                        height: 250,
                        width: 370,
                        child: Image(
                          image: NetworkImage(
                              '${Con.url}missings/${widget.image}'),
                          fit: BoxFit.cover,
                        )),
                  ),
                ),
                Container(
                  height: 410,
                  width: 380,
                  decoration: BoxDecoration(
                      //   border: Border.all(color: Color(0xff9088E4))
                      ),
                  child: Card(
                    elevation: 50,
                    child: DataTable(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      // clipBehavior:Clip.none,
                      columnSpacing: 3,
                      dataRowHeight: 43,

                      //  border: TableBorder.all(color: vio,),
                      columns: [
                        DataColumn(label: Text('Name')),
                        DataColumn(label: Text(widget.name)),
                      ],
                      rows: [
                        DataRow(cells: [
                          DataCell(Text('Health Condition ')),
                          DataCell(Text(': ${widget.health}')),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('Category ')),
                          DataCell(Text(': ${widget.animal}')),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('Color ')),
                          DataCell(Text(': ${widget.color}')),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('Breed ')),
                          DataCell(Text(': ${widget.breed}')),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('Last Seen At ')),
                          DataCell(Text(': ${widget.loc}')),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('Last Seen On ')),
                          DataCell(Text(': ${widget.miss_date}')),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('Reported On ')),
                          DataCell(Text(': ${widget.report_date}')),
                        ]),
                      ],
                    ),
                  ),
                ),
                SizedBox(
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
                        onPressed: () {},
                        child: Center(
                            child: ListTile(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text('Are you sure..'),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          markFound();
                                        },
                                        child: Text('Ok'),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text('Cancel'),
                                      ),
                                    ],
                                  );
                                });
                          },
                          title: Text(
                            'Found ?',
                            // style: btnHeadPlay,
                          ),
                          trailing: CircleAvatar(
                              backgroundColor: Colors.white54,
                              child: Icon(Icons.send)),
                        ))),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'If you find the pet ,please call the reporter below',
                  style: GoogleFonts.poppins(color: Colors.green),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    width: 260,
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(60), color: amb),
                    child: ListTile(
                      onTap: () {
                        Uri launchUri =
                            Uri(scheme: 'tel', path: '${widget.mob}');
                        launchUrl(launchUri);
                      },
                      title: Text(
                        'Call Reporter',
                        style: btnHeadPlay,
                      ),
                      leading: CircleAvatar(
                          backgroundColor: Colors.white54,
                          child: Icon(
                            Icons.phone,
                            color: Colors.red,
                          )),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
