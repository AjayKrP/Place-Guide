import 'package:flutter/material.dart';
import 'package:travel_guide/models/places.dart';

class WishList extends StatefulWidget {
  List<Place> places;

  WishList({Key key, @required this.places}) : super(key: key);
  _WishListState createState() => _WishListState();
}

class _WishListState extends State<WishList> {

  @override
  Widget build(BuildContext context) {
    return Container(

    );
  }
}