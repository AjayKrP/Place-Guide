import 'package:flutter/material.dart';
import 'package:travel_guide/screens/all_places.dart';
import 'package:travel_guide/screens/tabs/my_plans.dart';
import 'package:travel_guide/screens/tabs/profile.dart';
import 'package:travel_guide/screens/tabs/wishlist.dart';
import 'package:line_icons/line_icons.dart';


class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff388E3C),
        title: Center(
          child: Text(
            'City Guide',
            style:
                TextStyle(color: Colors.white70, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: TabBarView(
        children: [
          AllPlace(),
          WishList(),
          MyPlans(),
          Profile(),
        ],
      ),
      bottomNavigationBar: TabBar(
        tabs: [
          Tab(
            text: 'Explore',
            icon: new Icon(LineIcons.compass),
          ),
          Tab(
            text: 'Wishlist',
            icon: new Icon(LineIcons.heart),
          ),
          Tab(
            text: 'My Plans',
            icon: new Icon(Icons.book),
          ),
          Tab(
            text: 'Profile',
            icon: new Icon(Icons.person),
          )
        ],
        labelColor: Colors.yellow,
        unselectedLabelColor: Colors.blue,
        indicatorSize: TabBarIndicatorSize.label,
        indicatorPadding: EdgeInsets.all(5.0),
        indicatorColor: Colors.red,
      ),
    );
  }
}
