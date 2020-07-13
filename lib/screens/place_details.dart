import 'package:flutter/material.dart';
import 'package:travel_guide/screens/tabs/elements/highlights.dart';
import 'package:travel_guide/screens/tabs/elements/name_container.dart';

class PlaceDetails extends StatelessWidget {
  var placeDetail;

  PlaceDetails(this.placeDetail);

  String getHighlights() {
    if (this.placeDetail.highlights != null) {
      return this.placeDetail.highlights;
    } else {
      return "No data found!";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            floating: true,
            flexibleSpace: this.placeDetail.photo != null
                ? Image.network(this.placeDetail.photo)
                : Image.asset('images/google.png'),
            expandedHeight: 200,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Container(
                child: Column(
                  children: [
                    NameContainer(this.placeDetail),
                    Highlights(getHighlights()),
                  ],
                ),
              ),
              childCount: 1,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Add your onPressed code here!
        },
        label: Text('Add to Plan'),
        backgroundColor: Colors.green,
      ),
    );
  }
}
