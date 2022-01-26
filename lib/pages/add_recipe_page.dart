import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipe_lab/main.dart';
import 'package:recipe_lab/model/category.dart';
import 'package:recipe_lab/widgets/app_bar.dart';
import 'package:recipe_lab/widgets/category_item.dart';

class AddRecipePage extends StatefulWidget {
  static const String route = '/AddRecipePage';

  @override
  _AddRecipePageState createState() => _AddRecipePageState();
}

class _AddRecipePageState extends State<AddRecipePage> {
  int time = 10,selectedCuisine=-1;
  List<Category> categories = [];
  List<String> cuisines;

  @override
  void initState() {
    for (int i = 0; i < 10; i++) {
      categories.add(Category(
        name: 'Pizza',
        image:
            'https://images.unsplash.com/photo-1604382354936-07c5d9983bd3?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80',
      ));
    }
    cuisines = ["Chines", "Asians", "Italian"];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: appBar(title: 'Add New Recipe'),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Card(
                    margin: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    elevation: 3,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 25,
                        ),
                        Icon(
                          CupertinoIcons.cloud_upload,
                          color: Colors.green,
                          size: 80,
                        ),
                        Text(
                          'Upload Cover',
                          style: TextStyle(
                              fontFamily: 'Raleway',
                              letterSpacing: 1,
                              color: textColor,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 40,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  labelText('Name'),
                  SizedBox(
                    height: 8,
                  ),
                  buildEditText('Enter Recipe Name'),
                  SizedBox(
                    height: 16,
                  ),
                  labelText('Description'),
                  SizedBox(
                    height: 8,
                  ),
                  buildEditText('Enter Recipe Description'),
                  SizedBox(
                    height: 16,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: labelText('Select Category'),
            ),
            SizedBox(
              height: 8,
            ),
            buildCategoryContainer(),
            SizedBox(
              height: 16,
            ),
            labelText('Cuisine'),
            SizedBox(
              height: 8,
            ),
            buildCuisine(),
            SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                labelText('Time to cook'),
                labelText('$time min'),
              ],
            ),
            Slider(
              value: time.toDouble(),
              min: 0,
              max: 120,
              onChanged: (double newValue) {
                int newVal = newValue.round();
                if (newVal >= 10) {
                  setState(() {
                    time = newVal;
                  });
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCuisine() {
    return Container(
      height: 30,
      child: ListView.builder(
        itemCount: cuisines.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: (){
              setState(() {
                selectedCuisine=index;
              });
            },
            child: Card(
              margin: EdgeInsets.only(left: index==0?16:0,right: index!=0?16:0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  side: BorderSide(color: selectedCuisine==index?Colors.green:Colors.grey)),
              child: Center(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(cuisines[index],
                style: TextStyle(
                  color: selectedCuisine==index?Colors.green:textColor,
                  fontFamily: 'Raleway',
                  fontSize: 16,
                  fontWeight: FontWeight.w500
                ),),
              )),
            ),
          );
        },
      ),
    );
  }

  Widget buildCategoryContainer() {
    return Container(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {
          return buildCategory(index, categories[index]);
        },
      ),
    );
  }

  Widget buildEditText(String hintText) {
    return TextFormField(
      style: TextStyle(
        fontFamily: 'Raleway',
      ),
      maxLines: 1,
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          fontFamily: 'Raleway',
        ),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
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
    );
  }

  Widget labelText(String title) {
    return Text(title,
        style: TextStyle(
            color: textColor,
            fontFamily: 'Raleway',
            letterSpacing: 1,
            fontWeight: FontWeight.bold));
  }
}
