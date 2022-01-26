import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:recipe_lab/model/helping_methods.dart';
import 'package:recipe_lab/pages/add_recipe_page.dart';
import 'package:recipe_lab/pages/explore_page.dart';
import 'package:recipe_lab/pages/my_list_page.dart';
import 'package:recipe_lab/pages/profile_page.dart';
import 'package:recipe_lab/pages/recipe_page.dart';

class HomePage extends StatefulWidget {
  static const String route = '/HomePage';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex;
  List<BubbleBottomBarItem> navigationItems;

  void changePage(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  void initState() {
    currentIndex = 0;
    navigationItems = [
      buildBottomNavigationItem(
        title: 'Recipes',
        icon: Icons.local_dining,
        color: Colors.green,
      ),
      buildBottomNavigationItem(
        title: 'Search',
        icon: CupertinoIcons.search,
        color: Colors.indigo,
      ),
      buildBottomNavigationItem(
          title: 'My List',
          icon: CupertinoIcons.text_badge_checkmark,
          color: Color(0xffFC4B4E)),
      buildBottomNavigationItem(
          title: 'Profile',
          icon: CupertinoIcons.profile_circled,
          color: Colors.teal),
    ];
    super.initState();
  }

  Widget navigateToPage(int currentIndex) {
    switch (currentIndex) {
      case 0:
        return RecipePage();
      case 1:
        return ExplorePage();
      case 2:
        return MyListPage();
      case 3:
        return ProfilePage();
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: navigateToPage(currentIndex),
      floatingActionButton: FloatingActionButton(
        onPressed: () => HelpingMethods().navigate(
          routeName: AddRecipePage.route,
          context: context,
        ),
        child: Icon(CupertinoIcons.add),
        backgroundColor: Colors.green,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndDocked,
      bottomNavigationBar: buildBottomBar(),
    );
  }

  BubbleBottomBar buildBottomBar() {
    return BubbleBottomBar(
      opacity: .2,
      currentIndex: currentIndex,
      onTap: changePage,
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      elevation: 8,
      fabLocation: BubbleBottomBarFabLocation.end,
      hasNotch: true,
      hasInk: true,
      inkColor: Colors.black12,
      items: navigationItems,
    );
  }

  BubbleBottomBarItem buildBottomNavigationItem({
    @required String title,
    @required IconData icon,
    @required Color color,
  }) {
    return BubbleBottomBarItem(
      backgroundColor: color,
      icon: Icon(
        icon,
        color: Colors.black,
      ),
      activeIcon: Icon(
        icon,
        color: color,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'Raleway',
        ),
      ),
    );
  }
}
