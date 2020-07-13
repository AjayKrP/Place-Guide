import 'package:flutter/material.dart';
import 'package:travel_guide/screens/place_details.dart';

class IndividualPlace extends StatefulWidget {
  var data;
  IndividualPlace(this.data);
  @override
  _IndividualPlace createState() => _IndividualPlace(this.data);
}

class _IndividualPlace extends State<IndividualPlace> {
  var data;
  _IndividualPlace(this.data);
  var isWishlistChecked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      margin: EdgeInsets.all(8.0),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0))),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PlaceDetails(this.data)),
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8.0),
                      topRight: Radius.circular(8.0),
                    ),
                    child: this.data.photo != null
                        ? Image.network(this.data.photo)
                        : Image.network('https://placeimg.com/640/480/any',
                            // width: 300,
                            height: 130,
                            fit: BoxFit.fill),
                  ),
                  ListTile(
                    title: Text(data.name),
                    subtitle: Text('Location 1'),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: IconButton(
              onPressed: () {
                print('wishlist clicked');
                setState(() {
                  isWishlistChecked = !isWishlistChecked;
                });
              },
              tooltip: 'Added to Wishlist',
              icon: isWishlistChecked
                  ? Icon(
                      Icons.favorite,
                      color: Colors.red,
                    )
                  : Icon(
                      Icons.favorite_border,
                      color: Colors.white70,
                    ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: IconButton(
                onPressed: (){},
                icon: Icon(Icons.airplanemode_active),
                tooltip: 'Added to Plans',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
