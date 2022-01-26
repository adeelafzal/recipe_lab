import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

Widget buildRatingBar(double rating){
  return RatingBarIndicator(
    rating: rating,
    unratedColor: Colors.grey,
    itemBuilder: (context, index) => Icon(
      Icons.star,
      color: Colors.amber,
    ),
    itemCount: 5,
    itemSize: 15.0,
  );
}