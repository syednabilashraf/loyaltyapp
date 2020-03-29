import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:loyaltyappversion2/firebase_services/authentication.dart';
import 'package:loyaltyappversion2/firebase_services/database.dart';
import 'package:loyaltyappversion2/actors/user.dart';
import 'package:firebase_storage/firebase_storage.dart';



class AllRestaurants extends StatefulWidget {
  @override
  _AllRestaurantsState createState() => _AllRestaurantsState();
}

class _AllRestaurantsState extends State<AllRestaurants> {


String userpoints;
//
//  toto(DocumentSnapshot doc) {
//    QuerySnapshot poc= await db.collection('userData').where('email',isEqualTo:'123@gmail.com').getDocuments();
//    DocumentSnapshot dodo = poc.documents[0];
//    print(dodo.documentID);
//String docID=doc.documentID;
//Future <DocumentSnapshot> customerSnapshot=  db.document('/restaurantData/${docID}/customers/gUj5ARd2rDdCaf7cQvSGeaziBWr1').get();
//print(customerSnapshot.);



//    return Card(
//      child: Column(
//        mainAxisSize: MainAxisSize.min,
//        children: <Widget>[
//          ListTile(
//            leading: Icon(Icons.album),
//            title: Text(doc['name']),
//            subtitle: Text(doc['type']),
//          ),
//          ButtonBar(
//            children: <Widget>[
//              FlatButton(
//                child: const Text('View Info'),
//                onPressed: () {
//                  /* ... */
//                },
//              ),
//              FlatButton(
//                color: Colors.redAccent,
//                child:  StreamBuilder<DocumentSnapshot>(
//                  stream: db
//                      .document(
//                      '/restaurantData/${doc.documentID}/customers/gUj5ARd2rDdCaf7cQvSGeaziBWr1')
//                      .snapshots(),
//                  builder: (context, snapshot) {
//                    if (snapshot.connectionState == ConnectionState.active) {
//                      if (snapshot.data.exists) {
//                        return Text(snapshot.data.data['points']);
//                      }
//                      else{return SizedBox();}
//                    } else {
//                      return SizedBox();
//                    }
//                  },
//                ),
//                onPressed: () {
//                  /* ... */
//                },
//              ),
//            ],
//          ),
////             gUj5ARd2rDdCaf7cQvSGeaziBWr1'
//          StreamBuilder<DocumentSnapshot>(
//            stream: db
//                .document(
//                    '/restaurantData/${doc.documentID}/customers/gUj5ARd2rDdCaf7cQvSGeaziBWr1')
//                .snapshots(),
//            builder: (context, snapshot) {
//              if (snapshot.connectionState == ConnectionState.active) {
//                if (snapshot.data.exists) {
//                  return Text(snapshot.data.data['points']);
//                }
//                else{return SizedBox();}
//              } else {
//                return SizedBox();
//              }
//            },
//          ),
//        ],
//      ),
//    );



  Widget buildItem(DocumentSnapshot doc) {

//    print(FirebaseStorage().ref().child('{$doc.documentID}.jpg').getDownloadURL().toString());
     return Padding(padding: EdgeInsets.all(2.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            boxShadow: [
              BoxShadow(
                  color: Colors.black12,
                  spreadRadius: 2.0,
                  blurRadius: 5.0
              ),
            ]
        ),
        margin: EdgeInsets.all(5.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            FutureBuilder(
              future: FirebaseStorage().ref().child(doc.documentID).getDownloadURL(),
              builder:(context,snapshot){
                print('1');
                if(snapshot.connectionState==ConnectionState.done) {
                  print('2');
                  return  ClipRRect(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0),bottomLeft: Radius.circular(10.0)),
                    child: Image.network(snapshot.data.toString(),width: 80,height: 80,fit: BoxFit.cover,),
                  );
                }
                else if (snapshot.connectionState ==
                    ConnectionState.waiting)
                  return Container(
                      height: MediaQuery.of(context).size.height /
                          1.25,
                      width: MediaQuery.of(context).size.width /
                          1.25,
                      child: CircularProgressIndicator());

                else return Container();



              }  ,
            )






            ,
            SizedBox(
              width: 250,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(doc.data['name']),
                    Padding(
                      padding: const EdgeInsets.only(top: 2.0,bottom: 2.0),
                      child: Text(doc.data['type'],overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: 12.0,color: Colors.black54,),maxLines: 1,),
                    ),
//                    Text("Min. Order: ${object["minOrder"]}",style: TextStyle(fontSize: 12.0,color: Colors.black54),)
                  ],
                ),
              ),
            )
          ],
        ),
      ),);





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
              stream: Firestore.instance.collection('restaurantData').snapshots(),
              builder: (context, snapshot) {
                print(snapshot.connectionState);
                print(snapshot.hasData);

                if (snapshot.hasData &&
                    snapshot.connectionState == ConnectionState.active) {
                  print('yoyoyoy');

                  return ListView(
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
