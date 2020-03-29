import 'package:flutter/material.dart';
import 'package:loyaltyappversion2/pages/register.page.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:loyaltyappversion2/pages/HomePage.dart';
import 'package:loyaltyappversion2/pages/GetPoints.dart';
import 'package:loyaltyappversion2/pages/AllRestaurants.dart';
import 'package:loyaltyappversion2/pages/MyRestaurants.dart';
import 'package:loyaltyappversion2/pages/History.dart';
import 'package:loyaltyappversion2/pages/Profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:loyaltyappversion2/firebase_services/authentication.dart';
import 'package:loyaltyappversion2/firebase_services/database.dart';
import 'package:loyaltyappversion2/actors/user.dart';


void main() {
  runApp(MaterialApp(
    home: AllRestaurants(),
//    initialRoute: '/home',
    routes: {
      '/loginpage': (context) => LoginPage(),
      '/register': (context) => Register(),
      '/homepage': (context) => HomePage(),
      '/allrestaurants': (context) => AllRestaurants(),
      '/myrestaurants': (context) => MyRestaurants(),
      '/profile': (context) => Profile(),
      '/history': (context) => History(),
      '/getpoints': (context) => GetPoints(),
    },

//    routes: '/': (context)=>,
  ));
}




//class FirestoreCRUDPage extends StatefulWidget {
//  @override
//  FirestoreCRUDPageState createState() {
//    return FirestoreCRUDPageState();
//  }
//}
//
//class FirestoreCRUDPageState extends State<FirestoreCRUDPage> {
//  String id;
//  final db = Firestore.instance;
//  final _formKey = GlobalKey<FormState>();
//  String name;
//
//  Widget buildItem(DocumentSnapshot doc) {
//    return Card(
//      child: Padding(
//        padding: const EdgeInsets.all(20.0),
//        child: Column(
//          crossAxisAlignment: CrossAxisAlignment.start,
//          children: <Widget>[
//            Text(
//              'name: ${doc.data['name']}',
//              style: TextStyle(fontSize: 24),
//            ),
//            Text(
//              'todo: ${doc.data['todo']}',
//              style: TextStyle(fontSize: 20),
//            ),
//            SizedBox(height: 12),
//            Row(
//              mainAxisAlignment: MainAxisAlignment.end,
//              children: <Widget>[
////                FlatButton(
////                  onPressed: () => updateData(doc),
////                  child: Text('Update todo', style: TextStyle(color: Colors.white)),
////                  color: Colors.green,
////                ),
//                SizedBox(width: 8),
//                FlatButton(
//                  onPressed: () => deleteData(doc),
//                  child: Text('Delete'),
//                ),
//              ],
//            )
//          ],
//        ),
//      ),
//    );
//  }
//
//  TextFormField buildTextFormField() {
//    return TextFormField(
//      decoration: InputDecoration(
//        border: InputBorder.none,
//        hintText: 'name',
//        fillColor: Colors.grey[300],
//        filled: true,
//      ),
//      validator: (value) {
//        if (value.isEmpty) {
//          return 'Please enter some text';
//        }
//      },
//      onSaved: (value) => name = value,
//    );
//  }
//
////  @override
////  Widget build(BuildContext context) {
////    return Scaffold(
////      appBar: AppBar(
////        title: Text('Firestore CRUD'),
////      ),
////      body: ListView(
////        padding: EdgeInsets.all(8),
////        children: <Widget>[
////          Form(
////            key: _formKey,
////            child: buildTextFormField(),
////          ),
////          Row(
////            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
////            children: <Widget>[
////              RaisedButton(
////                onPressed: createData,
////                child: Text('Create', style: TextStyle(color: Colors.white)),
////                color: Colors.green,
////              ),
////              RaisedButton(
////                onPressed: id != null ? readData : null,
////                child: Text('Read', style: TextStyle(color: Colors.white)),
////                color: Colors.blue,
////              ),
////            ],
////          ),
////          StreamBuilder<QuerySnapshot>(
////            stream: db.collection('CRUD').snapshots(),
////            builder: (context, snapshot) {
////              if (snapshot.hasData) {
////                print('yoyoyoy');
////
////                return Column(
////                    children: snapshot.data.documents
////                        .map((doc) => buildItem(doc))
////                        .toList());
////              } else {
////                return SizedBox();
////              }
////            },
////          )
////        ],
////      ),
////    );
////  }
////
////  void createData() async {
////    if (_formKey.currentState.validate()) {
////      _formKey.currentState.save();
////      DocumentReference ref =
////          await db.collection('CRUD').add({'name': '$name 😎'});
////      setState(() => id = ref.documentID);
////      print(ref.documentID);
////    }
////  }
//
////  void readData() async {
////    DocumentSnapshot snapshot = await db.collection('CRUD').document().get();
////    print(snapshot.data(['name']));
////  }
//
////  void updateData(DocumentSnapshot doc) async {
////    await db.collection('CRUD').document(doc.documentID).updateData({'todo': 'please 🤫'});
////  }
//
//  void deleteData(DocumentSnapshot doc) async {
//    await db.collection('CRUD').document(doc.documentID).delete();
//    setState(() => id = null);
//  }
//}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email, _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                    child: Stack(
                  children: <Widget>[
                    Container(
                        padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                        child: Text('no',
                            style: TextStyle(
                                fontSize: 80.0, fontWeight: FontWeight.bold))),
                    Container(
                        padding: EdgeInsets.fromLTRB(16.0, 175.0, 0.0, 0.0),
                        child: Text('scoper',
                            style: TextStyle(
                                fontSize: 80.0, fontWeight: FontWeight.bold))),
//              Container(
//                  padding:EdgeInsets.fromLTRB(240.0, 175.0, 0.0, 0.0),
//                  child: Text(
//                      '.', style:TextStyle(color:Colors.green,fontSize:80.0,fontWeight: FontWeight.bold)
//
//                  )
//              )
                  ],
                )),
                Container(
                  padding: EdgeInsets.only(top: 35.0, left: 20, right: 20),
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        onSaved: (input) => _email = input,
                        decoration: InputDecoration(
                          labelText: 'EMAIL',
                          labelStyle: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.grey),
                        ),
                      ),
                      SizedBox(height: 20.0),
                      TextFormField(
                        onSaved: (input) => _password = input,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.grey),
                        ),
                        obscureText: true,
                      ),
                      SizedBox(height: 5.0),
                      Container(
                        alignment: Alignment(1.0, 0.0),
                        padding: EdgeInsets.only(top: 15.0, left: 20.0),
                        child: InkWell(
                          child: Text(
                            'Forgot Password',
                            style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline),
                          ),
                        ),
                      ),
                      SizedBox(height: 40.0),
                      Container(
                          height: 40.0,
                          child: Material(
                              borderRadius: BorderRadius.circular(20.0),
                              shadowColor: Colors.greenAccent,
                              color: Colors.green,
                              elevation: 7.0,
                              child: GestureDetector(
                                  onTap: () {
                                    signIn();
                                  },
                                  child: Center(
                                    child: Text(
                                      ''
                                      'LOGIN',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  )))),
                      SizedBox(height: 20.0),
                      Container(
                          height: 40.0,
                          color: Colors.transparent,
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black,
                                style: BorderStyle.solid,
                                width: 1.0,
                              ),
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Center(
                                  child: ImageIcon(
                                      AssetImage('assets/facebook.png'),
                                      color: Colors.black),
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Center(
                                  child: Text(
                                    'Login with Facebook',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,

//          fontFamily: 'Monyserrat',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ))
                    ],
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Don\'t have an account ?',
                      style: TextStyle(fontFamily: 'Montserrat'),
                    ),
                    SizedBox(width: 5.0),
                    RaisedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/register');
                      },
                      child: Text(
                        'Register',
                        style: TextStyle(
                            color: Colors.green,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline),
                      ),
                    )
                  ],
                ),
              ],
            )),
      ),
    );
  }

  void signIn() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      try {
        AuthResult result = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: _email.trim(), password: _password);
        FirebaseUser user =result.user;
        User(uid:user.uid);
print(user.uid);
if(result.user!=null){
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => HomePage()));}
      } catch (e) {
        print(e.message);
      }
    }
  }
}
