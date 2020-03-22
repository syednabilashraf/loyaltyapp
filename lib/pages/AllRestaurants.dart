import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:loyaltyappversion2/firebase_services/authentication.dart';
import 'package:loyaltyappversion2/firebase_services/database.dart';
import 'package:loyaltyappversion2/actors/user.dart';

class AllRestaurants extends StatefulWidget {
  @override
  _AllRestaurantsState createState() => _AllRestaurantsState();
}

class _AllRestaurantsState extends State<AllRestaurants> {
  final db = Firestore.instance;

//  String userpoints;

  toto(DocumentSnapshot doc) {
//    QuerySnapshot poc= await db.collection('userData').where('email',isEqualTo:'123@gmail.com').getDocuments();
//    DocumentSnapshot dodo = poc.documents[0];
//    print(dodo.documentID);
//String docID=doc.documentID;
//Stream <DocumentSnapshot> customerSnapshot=  db.document('/restaurantData/${docID}/customers/gUj5ARd2rDdCaf7cQvSGeaziBWr1').snapshots();
//print(customerSnapshot.);
  }

  Widget buildItem(DocumentSnapshot doc) {
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
                onPressed: () {
                  /* ... */
                },
              ),
              FlatButton(
                color: Colors.redAccent,
                child:  StreamBuilder<DocumentSnapshot>(
                  stream: db
                      .document(
                      '/restaurantData/${doc.documentID}/customers/gUj5ARd2rDdCaf7cQvSGeaziBWr1')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.active) {
                      if (snapshot.data.exists) {
                        return Text(snapshot.data.data['points']);
                      }
                      else{return SizedBox();}
                    } else {
                      return SizedBox();
                    }
                  },
                ),
                onPressed: () {
                  /* ... */
                },
              ),
            ],
          ),
//             gUj5ARd2rDdCaf7cQvSGeaziBWr1'
          StreamBuilder<DocumentSnapshot>(
            stream: db
                .document(
                    '/restaurantData/${doc.documentID}/customers/gUj5ARd2rDdCaf7cQvSGeaziBWr1')
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.active) {
                if (snapshot.data.exists) {
                  return Text(snapshot.data.data['points']);
                }
                else{return SizedBox();}
              } else {
                return SizedBox();
              }
            },
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
                if (snapshot.hasData &&
                    snapshot.connectionState == ConnectionState.active) {
//                  print('yoyoyoy');

                  return Column(
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
