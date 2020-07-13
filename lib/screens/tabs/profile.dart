import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Profile extends StatefulWidget {
  _Profile createState() => _Profile();
}

class _Profile extends State<Profile> {
  FirebaseUser _user;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<FirebaseUser> _handleSignIn() async {
    // hold the instance of the authenticated user
    FirebaseUser user;
    // flag to check whether we're signed in already
    bool isSignedIn = await _googleSignIn.isSignedIn();
    if (isSignedIn) {
      // if so, return the current user
      print('already sign in');
      var user =  await _auth.currentUser();
      setState(() {
        _user = user;
      });
    }
    return null;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Hero(
            tag: "DemoTag",
            child: Image.network(_user.photoUrl),
          ),
          Text(
            'ajay krp'
          ),
        ],
      ),
    );
  }
}
