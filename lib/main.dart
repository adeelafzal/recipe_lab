import 'package:flutter/material.dart';
import 'package:recipe_lab/pages/add_recipe_page.dart';
import 'package:recipe_lab/pages/explore_page.dart';
import 'package:recipe_lab/pages/home_page.dart';
import 'package:recipe_lab/pages/intro_page.dart';
import 'package:recipe_lab/pages/my_list_page.dart';
import 'package:recipe_lab/pages/profile_page.dart';
import 'package:recipe_lab/pages/recipe_page.dart';
import 'package:recipe_lab/pages/splash_page.dart';

void main() {
  runApp(MyApp());
}

const Color textColor  = Color(0xff11263C);
const Color backgroundColor  = Color(0xfff0f5f9);

class MyApp extends StatelessWidget {
  route({@required Widget pageName}) {
    return MaterialPageRoute(builder: (_) => pageName);
  }

  Route<dynamic> getRoutes(RouteSettings settings) {
    Map<Object, Object> map = settings.arguments;
    switch (settings.name) {
      case '/':
        return route(pageName: SplashPage());
      case IntroPage.route:
        return route(pageName: IntroPage());
      case HomePage.route:
        return route(pageName: HomePage());
      case RecipePage.route:
        return route(pageName: RecipePage());
      case ExplorePage.route:
        return route(pageName: ExplorePage());
      case AddRecipePage.route:
        return route(pageName: AddRecipePage());
      case MyListPage.route:
        return route(pageName: MyListPage());
      case ProfilePage.route:
        return route(pageName: ProfilePage());
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Recipe Lab',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      onGenerateRoute: getRoutes,
    );
  }
}
