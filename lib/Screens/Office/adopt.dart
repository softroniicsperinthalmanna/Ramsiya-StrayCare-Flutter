import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../SharedpreferenceUse/spUse.dart';
import '../../style/style.dart';
import 'adoptAccepted.dart';
import 'adoptRequest.dart';
import 'adoptedlist.dart';

class Adopt extends StatefulWidget {
  Adopt({
    Key? key,
  }) : super(key: key);
  // var uid;
  @override
  State<Adopt> createState() => _AdoptState();
}

class _AdoptState extends State<Adopt> {
  var lid;
  void initState() {
    super.initState();
    setState(() {
      SharedPreferencesHelper.getSavedData().then((value) {
        setState(() {
          lid = value;
        });
      });
      // myLogin();
    });
  }

  // Future<void> myLogin() async {
  //   setState(() async {
  //     lid = await getSavedData();
  //   });
  //
  //   print('LoginID:$lid');
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: amb,
          title: Text(
            'Adoptions',
            style: GoogleFonts.poppins(
                color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          bottom: const TabBar(
            tabs: [
              Tab(child: Text('Home')),
              Tab(child: Text('Requests')),
              Tab(child: Text('Accepted')),
            ],
          ),
        ),
        body: TabBarView(
          // physics: NeverScrollableScrollPhysics(),
          children: [
            AdoptedList(lid: lid),
            ToAdoptRequests(lid: lid),
            AdoptAccepted(lid: lid),
          ],
        ),
      ),
    ));
  }
}
