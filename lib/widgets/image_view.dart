
import 'package:flutter/material.dart';

Widget customImageView({
  @required String imageUrl,
  double width,
  double height,
}) {
  return FadeInImage.assetNetwork(
    height: height != null ? height : null,
    width: height != null ? width : null,
    fadeInCurve: Curves.easeInOut,
    fit: BoxFit.cover,
    placeholder: "images/placeholder.png",
    image: imageUrl,
  );
}