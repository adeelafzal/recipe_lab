import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:recipe_lab/model/helping_methods.dart';
import 'package:recipe_lab/pages/intro_page.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      HelpingMethods()
          .navigateAndReplace(routeName: IntroPage.route, context: context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff86BF3E),
      body: Center(
        child: AvatarGlow(
          glowColor: Colors.white,
          endRadius: 150.0,
          child: Material(
            elevation: 8.0,
            shape: CircleBorder(),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text(
                'Recipe\nLab',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xfffc4b4e),
                  fontFamily: 'Lobster',
                  letterSpacing: 5,
                  fontWeight: FontWeight.bold,
                ),
              ),
              radius: 50.0,
            ),
          ),
        ),
      ),
    );
  }
}
