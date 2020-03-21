import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:loyaltyappversion2/firebase_services/authentication.dart';
import 'package:loyaltyappversion2/firebase_services/database.dart';

class AllRestaurants extends StatefulWidget {
  @override
  _AllRestaurantsState createState() => _AllRestaurantsState();
}

class _AllRestaurantsState extends State<AllRestaurants> {
  final db = Firestore.instance;


  Widget buildItem(DocumentSnapshot doc) {
    print(doc.data['name']);
    print(doc.documentID);
    return Card(

      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
           ListTile(

            leading: Icon(Icons.album),
            title: Text(doc['name']),
            subtitle: Text(doc['type']),
          ),
          ButtonBar(
            children: <Widget>[
              FlatButton(
                child: const Text('View Info'),
                onPressed: () { /* ... */ },
              ),
              FlatButton(
                child: const Text('View points'),
                onPressed: () { /* ... */ },
              ),
            ],
          ),
        ],
      ),
    );

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('All Restaurants'),
          centerTitle: true,
        ),
        drawer: Drawer(
          child: ListView(padding: EdgeInsets.zero, children: <Widget>[
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
        body: ListView(
          padding: EdgeInsets.all(8),
          children: <Widget>[
//            Form(
//              key: _formKey,
//              child: buildTextFormField(),
//            ),
//            Row(
//              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//              children: <Widget>[
//                RaisedButton(
//                  onPressed: createData,
//                  child: Text('Create', style: TextStyle(color: Colors.white)),
//                  color: Colors.green,
//                ),
//                RaisedButton(
//                  onPressed: id != null ? readData : null,
//                  child: Text('Read', style: TextStyle(color: Colors.white)),
//                  color: Colors.blue,
//                ),
//              ],
//            ),
            StreamBuilder<QuerySnapshot>(
              stream: db.collection('restaurantData').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  print('yoyoyoy');

                  return  Column(
                      children: snapshot.data.documents
                          .map((doc) => buildItem(doc))
                          .toList());
                } else {
                  return SizedBox();
                }
              },
            )
          ],
        ));
  }
}
