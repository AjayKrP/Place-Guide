import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:travel_guide/screens/individual_place.dart';
import 'package:travel_guide/screens/place_details.dart';
import 'package:travel_guide/models/places.dart';
import 'dart:convert';

class AllPlace extends StatefulWidget {
  @override
  _AllPlace createState() => _AllPlace();
}


class _AllPlace extends State<AllPlace> {
  Future<String> _loadAllPlaces() async {
    return await rootBundle.loadString('assets/location.json');
  }

  Future loadPlaces(String type) async {
    String jsonString = await _loadAllPlaces();
    final jsonResponse = json.decode(jsonString);
    final jsonData = jsonResponse[type];
    PlaceList placeList = PlaceList.fromJson(jsonData);
    return placeList.list;
  }

  ///List of questions uses futurBuilder.
  Widget buildListItems(String type) {
    return FutureBuilder(
      future: loadPlaces(type),
      builder: (context, snapshot) {
        if (!snapshot.hasData)
          return Center(child: new CircularProgressIndicator());
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  type,
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
              height: 250,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: snapshot.data.length,
                itemBuilder: (context, i) {
                  String name;
                  name = snapshot.data[i].name;
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      child: IndividualPlace(snapshot.data[i]),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        buildListItems('forts'),
        buildListItems('Temple'),
        buildListItems('Fun and Treak'),
        buildListItems('Beaches'),
      ],
    );
  }
}

//https://medium.com/flutter-community/parsing-complex-json-in-flutter-747c46655f51
