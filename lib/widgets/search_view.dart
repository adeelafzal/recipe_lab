import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipe_lab/main.dart';

Widget buildSearchAndFilter() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 13),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: TextFormField(
            style: TextStyle(
              fontFamily: 'Raleway',
            ),
            maxLines: 1,
            textInputAction: TextInputAction.search,
            decoration: InputDecoration(
              hintText: 'Search For Recipes',
              hintStyle: TextStyle(
                fontFamily: 'Raleway',
              ),
              contentPadding: new EdgeInsets.all(0),
              prefixIcon: Icon(CupertinoIcons.search),
              filled: true,
              fillColor: Color(0xfff0f5f9),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: backgroundColor),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: backgroundColor),
                borderRadius: BorderRadius.circular(10),
              ),
              border: InputBorder.none,
            ),
          ),
        ),
        SizedBox(
          width: 13,
        ),
        Container(
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: IconButton(
            icon: Icon(Icons.tune),
            onPressed: () {},
          ),
        ),
      ],
    ),
  );
}