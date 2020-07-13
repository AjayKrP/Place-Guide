import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:line_icons/line_icons.dart';

class NameContainer extends StatefulWidget {
  var placeDetail;
  NameContainer(this.placeDetail);
  _NameContainer createState() => _NameContainer(this.placeDetail);
}

class _NameContainer extends State<NameContainer> {
  var placeDetail;
  _NameContainer(this.placeDetail);
  @override
  Widget build(BuildContext context) {
    double c_width = MediaQuery.of(context).size.width * 0.8;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Container(
            child: Text(
              this.placeDetail.name,
              textAlign: TextAlign.left,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
            ),
            alignment: Alignment.centerLeft,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RatingBar(
                    initialRating: 3,
                    minRating: 1,
                    itemSize: 18,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text('${800} reviews'),
                  ),
                ],
              ),
              SizedBox(
                height: 5.0,
              ),
              Row(
                children: [
                  Icon(
                    Icons.place,
                    size: 18.0,
                  ),
                  InkWell(
                    onTap: () {},
                    child: RichText(
                      text: TextSpan(
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                          ),
                          children: [
                            TextSpan(text: 'Location'),
                          ]),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 5.0,
              ),
              Row(
                children: [
                  Icon(
                    Icons.watch_later,
                    size: 16.0,
                  ),
                  InkWell(
                    onTap: () {},
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                        ),
                        children: [
                          TextSpan(
                              text: 'Closed Now',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(
                            text: '-',
                          ),
                          TextSpan(text: '9:00 AM - 6:00 PM'),
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
