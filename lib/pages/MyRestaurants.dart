import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
class MyRestaurants extends StatefulWidget {
  @override
  _MyRestaurantsState createState() => _MyRestaurantsState();
}

//
//static Future<dynamic> loadImage(BuildContext context, String image) async {
//return await FirebaseStorage.instance.ref().child(image).getDownloadURL();
//}
//
//FirebaseStorage a = FirebaseStorage.instance.ref().child(path).
//



class _MyRestaurantsState extends State<MyRestaurants> {


  @override
  Widget build(BuildContext context) {

    var screenHeight = MediaQuery.of(context).size.height;
    var screenwidth= MediaQuery.of(context).size.width;
    return Scaffold(

      appBar: AppBar(
        title: Text('My Restaurants'),
        centerTitle: true,
      ),
      body: Container(
        height: screenHeight,
        width: screenwidth,
        child:
        SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment:  CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(icon: Icon(Icons.menu), onPressed: (){}),
                    Text('My Restaurants'),
                    IconButton(icon: Icon(Icons.person), onPressed: null)
                    
                  ],

                )
              ],


            )
            )
          )
        ),





















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
