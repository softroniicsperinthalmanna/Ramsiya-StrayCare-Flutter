import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var bubble = BoxDecoration(
    image: DecorationImage(
        image: AssetImage(
          "assets/images/AppHome.png",
        ),
        fit: BoxFit.cover));
var btnDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(60), color: Color(0xff9088E4));
InputDecoration dec(String labelname) {
  return InputDecoration(
    labelText: labelname,
    // border: myinputborder(), //normal border
    // enabledBorder: myinputborder(), //enabled border
    // focusedBorder: myfocusborder(), //focused border
    // set more border style like disabledBorder
  );
}

var authHead = GoogleFonts.poppins(color: Colors.amber, fontSize: 35);

var authBtn = GoogleFonts.poppins(color: Colors.amber, fontSize: 25);

var btnText = GoogleFonts.poppins(color: Colors.white, fontSize: 20);
var boardText = GoogleFonts.poppins(
    color: Color(0xff9088E4), fontSize: 15, fontWeight: FontWeight.bold);
var boardTextBig = GoogleFonts.poppins(
    color: Color(0xff9088E4), fontSize: 20, fontWeight: FontWeight.bold);
var locationText = GoogleFonts.poppins(color: Colors.red, fontSize: 16);
var mainHead = GoogleFonts.playball(fontSize: 72, color: Color(0xff9088E4));
var subHead = GoogleFonts.poppins(fontSize: 35, color: Color(0xff9088E4));
var btnHeadPlay = GoogleFonts.poppins(fontSize: 23, color: Colors.white);
var vioBtnHeadPlay =
    GoogleFonts.poppins(fontSize: 23, color: Color(0xff9088E4));
var normalTextPlay =
    GoogleFonts.poppins(fontSize: 16, color: Color(0xff9088E4));
var whitenormal13 = GoogleFonts.poppins(fontSize: 13, color: Colors.white70);
var rednormal13 = GoogleFonts.poppins(fontSize: 13, color: Colors.red);
var blackTextPlay = GoogleFonts.poppins(fontSize: 16, color: Colors.black);
var whiteTextPlay = GoogleFonts.poppins(fontSize: 25, color: Colors.white);
var amb = const Color(0xedf8a304);

var normalText = GoogleFonts.poppins(color: Color(0xffffffff), fontSize: 16);
