import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:recipe_lab/model/helping_methods.dart';
import 'package:recipe_lab/pages/home_page.dart';

class IntroPage extends StatelessWidget {
  static const String route = '/IntroPage';

  List<String> tagLines = [
    "Cooking delicious food easily.",
    "Best app to learn cooking step by step.",
    "Cooking is like making love, you do it well, or you do not do it at all.",
    "Discover more than 500 food recipes in your hands and cooking it easily!",
  ];

  List<String> images = [
    "intro0",
    "intro1",
    "intro6",
    "intro7",
  ];

  List<Color> tagColors = [
    Color(0xffffffff),
    Color(0xff86BF3E),
    Color(0xff8A949F),
    Color(0xffFC4B4E),
    Color(0xffFEC740),
    Color(0xff11263C),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Swiper(
            autoplay: true,
            itemBuilder: (BuildContext context, int index) {
              return Image.asset(
                "images/${images[index]}.jpg",
                fit: BoxFit.cover,
              );
            },
            itemCount: images.length,
          ),
          Column(
            children: [
              Spacer(),
              Center(
                child: Card(
                  elevation: 3,
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  color: Colors.black54,
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: ColorizeAnimatedTextKit(
                      repeatForever: true,
                      text: tagLines,
                      textStyle: TextStyle(
                          fontSize: 20.0,
                          fontFamily: "Raleway",
                          fontWeight: FontWeight.w500),
                      colors: tagColors,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              Spacer(),
              RaisedButton(
                onPressed: () => HelpingMethods().navigateAndReplace(
                    routeName: HomePage.route, context: context),
                child: Text(
                  'Get Started',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Raleway',
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold),
                ),
                color: Color(0xff86BF3E),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
              ),
              SizedBox(height: 20)
            ],
          ),
        ],
      ),
    );
  }
}
