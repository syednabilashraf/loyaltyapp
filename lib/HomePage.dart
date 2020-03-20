import 'package:flutter/material.dart';
import 'package:loyaltyappversion2/register.page.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:loyaltyappversion2/HomePage.dart';
import 'package:loyaltyappversion2/GetPoints.dart';
import 'package:loyaltyappversion2/AllRestaurants.dart';
import 'package:loyaltyappversion2/MyRestaurants.dart';
import 'package:loyaltyappversion2/History.dart';
import 'package:loyaltyappversion2/Profile.dart';
import 'package:firebase_auth/firebase_auth.dart';


class HomePage extends StatefulWidget {

  const HomePage({Key key, this.user}) : super(key: key);
  final AuthResult user;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Feed'),centerTitle: true,),
      body: Center(child: Text('My Page!')),
      drawer: Drawer(

        child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text('Profile pic /logo here'),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
              ListTile(
                title: Text('Get Points'),
                onTap: () {

                  Navigator.pop(context);
                  Navigator.pushReplacementNamed(context, '/getpoints');
                },
              ),
              ListTile(
                title: Text('My Restaurants'),
                onTap: () {

                  Navigator.pop(context);
                  Navigator.pushReplacementNamed(context, '/myrestaurants');
                },
              ),
              ListTile(
                title: Text('All Restaurants'),
                onTap: () {

                  Navigator.pop(context);
                  Navigator.pushReplacementNamed(context, '/allrestaurants');
                },
              ),
              ListTile(
                title: Text('History'),
                onTap: () {

                  Navigator.pop(context);
                  Navigator.pushReplacementNamed(context, '/history');
                },
              ),
              ListTile(
                title: Text('Profile'),
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/profile');

//                Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Sign Out'),
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/loginpage');

                },
              ),
            ]),
      ),
      );

  }
}
