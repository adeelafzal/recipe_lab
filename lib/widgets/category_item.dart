import 'package:flutter/material.dart';
import 'package:recipe_lab/main.dart';
import 'package:recipe_lab/model/category.dart';
import 'package:recipe_lab/widgets/image_view.dart';

Widget buildCategory(int index,Category category) {
  return Container(
    height: 120,
    width: 120,
    margin: EdgeInsets.only(
        left: index == 0 ? 13 : 8,
        right: index == 10 - 1 ? 13 : 0),
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      elevation: 3,
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(11)),
              child: customImageView(
                imageUrl: category.image,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(category.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.bold,
                    color: textColor)),
          ],
        ),
      ),
    ),
  );
}