import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:recipe_lab/main.dart';
import 'package:recipe_lab/model/category.dart';
import 'package:recipe_lab/model/recipe.dart';
import 'package:recipe_lab/widgets/app_bar.dart';
import 'package:recipe_lab/widgets/category_item.dart';
import 'package:recipe_lab/widgets/image_view.dart';
import 'package:recipe_lab/widgets/rating_bar.dart';
import 'package:recipe_lab/widgets/recipe_item.dart';
import 'package:recipe_lab/widgets/search_view.dart';

class RecipePage extends StatefulWidget {
  static const String route = '/RecipePage';

  @override
  _RecipePageState createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  List<Recipe> popularRecipes = [];
  List<Category> categories = [];

  @override
  void initState() {
    for (int i = 0; i < 10; i++) {
      popularRecipes.add(Recipe(
        title: 'Pizza',
        imageUrl:
            'https://images.unsplash.com/photo-1604382354936-07c5d9983bd3?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80',
        rating: 3.5,
        totalRating: '24',
      ));
      categories.add(Category(
        name: 'Pizza',
        image:
            'https://images.unsplash.com/photo-1604382354936-07c5d9983bd3?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80',
      ));
    }
    super.initState();
  }

  Widget buildTitleHeading({String title}) {
    return Padding(
      padding: const EdgeInsets.only(left: 13),
      child: Text(title,
          style: TextStyle(
              fontSize: 16,
              fontFamily: 'Raleway',
              fontWeight: FontWeight.bold,
              color: textColor)),
    );
  }

  Widget buildPopularRecipeItem(Recipe recipe, int index) {
    return Container(
      width: 160,
      margin: EdgeInsets.only(
          left: index == 0 ? 13 : 8,
          right: index == popularRecipes.length - 1 ? 13 : 0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        elevation: 3,
        child: Stack(
          fit: StackFit.expand,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: customImageView(
                imageUrl: recipe.imageUrl,
              ),
            ),
            Positioned(
              bottom: 2,
              left: 2,
              right: 2,
              child: Card(
                color: Colors.black38,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6)),
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(recipe.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          buildRatingBar(recipe.rating),
                          Text('(${recipe.totalRating})',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontFamily: 'Raleway',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPopularRecipe() {
    return Container(
      height: 220,
      child: ListView.builder(
        itemCount: popularRecipes.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return buildPopularRecipeItem(popularRecipes[index], index);
        },
      ),
    );
  }

  Widget buildForYou() {
    return ListView.builder(
      primary: false,
      shrinkWrap: true,
      itemCount: popularRecipes.length,
      itemBuilder: (BuildContext context, int index) {
        return buildRecipeItem(popularRecipes[index]);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: appBar(title:'Recipe Lab'),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 13),
              color: Colors.white,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildTitleHeading(title: 'Popular Recipes'),
                  SizedBox(height: 8),
                  buildPopularRecipe(),
                ],
              ),
            ),
            SizedBox(height: 13),
            buildTitleHeading(title: 'Category'),
            SizedBox(height: 8),
            Container(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return buildCategory(index,categories[index]);
                },
              ),
            ),
            SizedBox(height: 8),
            buildTitleHeading(title: 'Just For You'),
            SizedBox(
              height: 8,
            ),
            buildForYou(),
          ],
        ),
      ),
    );
  }
}
