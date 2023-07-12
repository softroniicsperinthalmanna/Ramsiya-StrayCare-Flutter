import 'package:flutter/material.dart';

Widget textformfield({contentColor,hint, fcolor, fsize, filled,bordercolor, hpad, vpad, radius,fillcolor,controller,s_icon,border_style}) {
  return TextFormField(
    controller: controller,
      style: TextStyle(color:contentColor ),


      decoration: InputDecoration(
        suffixIcon: Icon(s_icon),
          fillColor: fillcolor,
          filled: filled,
          border: OutlineInputBorder(

              borderRadius: BorderRadius.circular(radius),
              borderSide:border_style==null? BorderSide.none:
              BorderSide(color: bordercolor, style: border_style)),
          enabledBorder: OutlineInputBorder(

              borderRadius: BorderRadius.circular(radius),
              borderSide:border_style==null? BorderSide.none:
              BorderSide(color: bordercolor, style: border_style)),
          focusedBorder: OutlineInputBorder(

              borderRadius: BorderRadius.circular(radius),
              borderSide:border_style==null? BorderSide.none:
              BorderSide(color: bordercolor, style: border_style)),
          contentPadding:
          EdgeInsets.symmetric(horizontal: hpad, vertical: vpad),
          hintText: hint,
          hintStyle: TextStyle(
            fontSize: fsize,
            color: fcolor,
          )));
}

Widget getTextField(hint, fcolor, fsize, bordercolor, hpad, vpad, radius,{callback,controller}) {
  return Material(

    elevation: 5,
    borderRadius: BorderRadius.circular(radius),
    child: TextField(
      onTap: callback,
      controller: controller,
        decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius),
                borderSide:
                BorderSide(color: bordercolor, style: BorderStyle.solid)),
            contentPadding:
            EdgeInsets.symmetric(horizontal: hpad, vertical: vpad),
            hintText: hint,
            hintStyle: TextStyle(
              fontSize: fsize,
              color: fcolor,
            ))),
  );
}
