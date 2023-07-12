// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:http/http.dart';
// import '../../CONNECTION/connection.dart';
// import 'adopt.dart';
// import 'adoptRequest.dart';
// import 'adoptedlist.dart';
// import 'collectedlist.dart';
// import 'deadlist.dart';
// import 'fosteringlist.dart';
// class ViewList extends StatefulWidget {
//    ViewList({Key? key,required this.uid}) : super(key: key);
// var uid;
//   @override
//   State<ViewList> createState() => _ViewListState();
// }
//
// class _ViewListState extends State<ViewList> {
//    var _selectedItem;
//    var office,email,phone;
//
//    Future<void> getData() async {
//      var data = {
//        'officeId':widget.uid
//      };
//      var response = await post(Uri.parse('${Con.url}getOfficeData.php'), body: data);
//      print(response.body);
//      print(response.statusCode);
//      if(jsonDecode(response.body)['result']=='success'){
//        office=jsonDecode(response.body)['location'];
//        email=jsonDecode(response.body)['email'];
//        phone=jsonDecode(response.body)['phone'];
//        print(office);
//        print(email);
//        print(phone);
//        return jsonDecode(response.body);
//      }
//
//
//    }
//
//
//   @override
//   void initState(){
//      super.initState();
//      print(widget.uid);
//      getData();
//      setState(() {
//
//      });
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//             onPressed: () {
//               showDialog(
//                   context: context,
//                   builder: (context) {
//                     return AlertDialog(
//                       content: Text('Do you want to LogOut ?'),
//                       actions: [
//                         TextButton(
//                             onPressed: () {
//                               // Navigator.pushReplacement(
//                               //     context,
//                               //     MaterialPageRoute(
//                               //         builder: (context) => LoginIndex()));
//                             },
//                             child: Text('Yes')),
//                         TextButton(
//                             onPressed: () {
//                               Navigator.pop(context);
//                             },
//                             child: Text('No')),
//                       ],
//                     );
//                   });
//             },
//             icon: Icon(Icons.arrow_back_outlined)),
//         // title: Text("Reports"),
//         // centerTitle: true,
//         backgroundColor: Color(0xff9088E4),
//         actions: [
//           PopupMenuButton(
//               onSelected: (item) {
//                 setState(() {
//                   _selectedItem = item;
//                 });
//
//                 switch (_selectedItem) {
//                   case 'logout':
//                     // Navigator.pushReplacement(context,
//                     //     MaterialPageRoute(builder: (context) => LoginIndex()));
//                     break;
//                 }
//               },
//               icon: Icon(Icons.logout),
//               itemBuilder: (context) {
//                 return [
//                   PopupMenuItem(value: 'logout', child: Text('LogOut')),
//                 ];
//               }),
//         ],
//       ),
//
//       body:Container(
//         height: double.infinity,
//         width: double.infinity,
//
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               SizedBox(
//                 height: 30,
//               ),
//               Container(
//                   height: 100,
//                   width: 350,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(60),
//                       color: Color(0xff9088E4)
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.all(15.0),
//                     child: ListTile(
//                       title: Row(
//                         children: [
//                           Icon(Icons.location_on_outlined),
//                           Text('$office Office'),
//                         ],
//
//                       ),
//                       subtitle:Column(
//                         children: [
//                           Row(
//                             children: [
//                               Icon(Icons.email),
//                               Text('$email'),
//                             ],
//
//                           ),Row(
//                             children: [
//                               Icon(Icons.phone),
//                               Text('$phone'),
//                             ],
//
//                           ),
//                         ],
//                       ),
//                     ),
//                   )
//               ),
//               SizedBox(height: 70,),
//
//               InkWell(
//                 onTap: (){
//
//                   Navigator.push(context, MaterialPageRoute(builder: (context)=>Collectedlist(
//
//                   )));
//                 },
//                 child: Container(
//                     height: 70,
//                     width: 350,
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(60),
//                         color: Color(0xff9088E4)
//                     ),
//                     child:Center(child: Text(' Collections ',style: TextStyle(color:Colors.white,fontSize: 23),))
//                 ),
//               ),
//                SizedBox(height: 70,),
//               InkWell(
//                 onTap: (){
//                                 Navigator.push(context, MaterialPageRoute(builder: (context)=>FosteringList(
//
//                                 )));
//
//                 },
//                 child: Container(
//                     height: 70,
//                     width: 350,
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(60),
//                         color: Color(0xff9088E4)
//                     ),
//                     child:Center(child: Text('Fosterings',style: TextStyle(color: Colors.white,fontSize: 23
//                     ),))
//                 ),
//               ),
//               SizedBox(height: 70,),
//
//               InkWell(
//                 onTap: (){
//                   Navigator.push(context, MaterialPageRoute(builder: (context)=>Adopt(
//                     uid: widget.uid,
//                   )));
//
//                 },
//                 child: Container(
//                     height: 70,
//                     width: 350,
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(60),
//                         color: Color(0xff9088E4)
//                     ),
//                     child:Center(child: Text('Adoptions',style: TextStyle(color: Colors.white,fontSize: 23),)
//                     )
//                 ),
//               ),
//               SizedBox(height: 70,),
//
//               InkWell(
//                 onTap: (){
//                   Navigator.push(context, MaterialPageRoute(builder: (context)=>DeadList(uid: widget.uid,)));
//
//                 },
//                 child: Container(
//                     height: 70,
//                     width: 350,
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(60),
//                         color: Color(0xff9088E4)
//                     ),
//                     child:Center(child: Text('No Mores',style: TextStyle(color: Colors.white,fontSize: 23),))
//                 ),
//               )
//
//             ],
//           ),
//         )
//       ),
//       floatingActionButton: FloatingActionButton(
//         backgroundColor:Color(0xff9088E4) ,
//         foregroundColor: Colors.white,
//         onPressed: () {
//           showDialog(
//               context: context,
//               builder: (context) {
//                 return AlertDialog(
//                   content: Text('Do you want to LogOut ?'),
//                   actions: [
//                     TextButton(
//                         onPressed: () {
//                           // Navigator.pushReplacement(
//                           //     context,
//                           //     MaterialPageRoute(
//                           //         builder: (context) => LoginIndex()));
//                         },
//                         child: Text('Yes')),
//                     TextButton(
//                         onPressed: () {
//                           Navigator.pop(context);
//                         },
//                         child: Text('No')),
//                   ],
//                 );
//               });
//         },
//         child: Icon(Icons.arrow_back_ios_new,size: 30,),
//       ),
//
//     );
//   }
// }
