import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:recipe_lab/main.dart';
import 'package:recipe_lab/model/recipe.dart';
import 'package:recipe_lab/widgets/app_bar.dart';
import 'package:recipe_lab/widgets/image_view.dart';
import 'package:recipe_lab/widgets/recipe_item.dart';
import 'package:recipe_lab/widgets/search_view.dart';

class ExplorePage extends StatefulWidget {
  static const String route = '/ExplorePage';

  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  List<Recipe> searchResult = [];

  @override
  void initState() {
    for (int i = 0; i < 10; i++) {
      searchResult.add(Recipe(
        title: 'Pizza',
        imageUrl:
            'https://images.unsplash.com/photo-1604382354936-07c5d9983bd3?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80',
        rating: 3.5,
        totalRating: '24',
      ));
      super.initState();
    }
  }

  Widget buildSearchList() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 5,
      itemBuilder: (BuildContext context, int index) {
        return buildRecipeItem(searchResult[index]);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(title: 'Search Recipes'),
      body: Column(
        children: [
          SizedBox(
            height: 13,
          ),
          buildSearchAndFilter(),
          SizedBox(
            height: 13,
          ),
          //Expanded(child: buildSearchList()),
          Expanded(child: Image.asset('images/search.png'))
        ],
      ),
    );
  }
}
