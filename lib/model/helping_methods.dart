import 'package:flutter/cupertino.dart';

class HelpingMethods {
  navigateAndReplace({
    @required String routeName,
    @required BuildContext context,
  }) {
    Navigator.pushReplacementNamed(context, routeName);
  }

  navigate({
    @required String routeName,
    @required BuildContext context,
  }) {
    Navigator.pushNamed(context, routeName);
  }

}
