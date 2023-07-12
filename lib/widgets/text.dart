import 'package:flutter/material.dart';

Widget text(text, fsize, color, fw) {
  return Text(text,
    style: TextStyle(
      fontSize: fsize,
      fontWeight: fw,
      color: color,
    ),
    textAlign: TextAlign.justify,
  );
}