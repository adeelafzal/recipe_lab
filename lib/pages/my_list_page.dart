import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipe_lab/main.dart';
import 'package:recipe_lab/widgets/app_bar.dart';

class MyListPage extends StatefulWidget {
  static const String route = '/MyListPage';

  @override
  _MyListPageState createState() => _MyListPageState();
}

class _MyListPageState extends State<MyListPage> {
  bool isFav = true, isShop = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(title: 'My List'),
      body: Column(
        children: [
          SizedBox(
            height: 6,
          ),
          Row(
            children: [
              SizedBox(
                width: 16,
              ),
              tabBarItem('Favourite', () {
                setState(() {
                  isFav = true;
                  isShop = false;
                });
              }, isFav ? Colors.green : Colors.white),
              SizedBox(
                width: 16,
              ),
              tabBarItem('Shop', () {
                setState(() {
                  isShop = true;
                  isFav = false;
                });
              }, isShop ? Colors.green : Colors.white)
            ],
          ),
          SizedBox(
            height: 6,
          ),
          isFav ? buildFav() : buildShop(),
        ],
      ),
    );
  }

  Widget buildFav() {
    return displayPlaceHolder('fav_place.png');
  }

  Widget buildShop() {
    return Column(
      children: [
        Divider(
          height: 1,
        ),
        ListTile(
          contentPadding: const EdgeInsets.only(left: 18),
          dense: true,
          leading: Icon(
            CupertinoIcons.add_circled,
            color: Colors.green,
          ),
          title: Align(
            alignment: Alignment(-1.2, 0),
            child: Text(
              'Add to Shopping List',
              style: TextStyle(
                  color: textColor,
                  fontFamily: 'Raleway',
                  letterSpacing: 1,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Divider(
          height: 1,
          thickness: 1,
        ),
        Column(
          children: [
            SizedBox(
              height: 100,
            ),
            Icon(
              CupertinoIcons.cart,
              size: 100,
              color: textColor,
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              'Shopping List is empty',
              style: TextStyle(
                  color: textColor,
                  fontFamily: 'Raleway',
                  letterSpacing: 1,
                  fontWeight: FontWeight.w900),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              'Start your Shopping List by adding\ningredients using the Add button above.',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: textColor,
                  fontFamily: 'Raleway',
                  letterSpacing: 1,
                  fontWeight: FontWeight.w500),
            ),
          ],
        )
      ],
    );
  }

  Widget displayPlaceHolder(String image) {
    return Expanded(
      child: Image.asset('images/$image'),
    );
  }

  Widget tabBarItem(String title, Function onPressed, Color color) {
    return RaisedButton(
      child: Text(
        title,
        style: TextStyle(
            color: color == Colors.green ? Colors.white : Colors.green,
            fontFamily: 'Raleway',
            letterSpacing: 1,
            fontWeight: FontWeight.w900),
      ),
      color: color == Colors.green ? Colors.green : Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          side: BorderSide(color: Colors.green)),
      onPressed: onPressed,
    );
  }
}
