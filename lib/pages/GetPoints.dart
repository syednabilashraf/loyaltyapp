import 'package:flutter/material.dart';

class GetPoints extends StatefulWidget {
  @override
  _GetPointsState createState() => _GetPointsState();
}

class _GetPointsState extends State<GetPoints> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Get Points'),
        centerTitle: true,
      ),
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
