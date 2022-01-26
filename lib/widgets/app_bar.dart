import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

AppBar appBar({String title}) {
  return AppBar(
    title: Text(
      title,
      style: TextStyle(
        letterSpacing: 1.5,
          fontWeight: FontWeight.bold,
          fontFamily: 'Raleway'),
    ),
    centerTitle: true,
  );
}
