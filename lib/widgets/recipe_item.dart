import 'package:flutter/material.dart';
import 'package:recipe_lab/model/recipe.dart';
import 'package:recipe_lab/widgets/image_view.dart';

Widget buildRecipeItem(Recipe recipe) {
  return Container(
    height: 250,
    child: Stack(
      fit: StackFit.expand,
      children: [
        customImageView(imageUrl: recipe.imageUrl),
        Align(
          alignment: Alignment.bottomLeft,
          child: ListTile(
            tileColor: Colors.black26,
            dense: true,
            title: Text(recipe.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: 16,
                    letterSpacing: 2,
                    fontFamily: 'Lobster',
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
            subtitle: Text(recipe.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: 16,
                    letterSpacing: 2,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
            trailing: ClipRRect(
              borderRadius: BorderRadius.circular(25.0),
              child: customImageView(
                width: 50,
                height: 50,
                imageUrl: recipe.imageUrl,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}