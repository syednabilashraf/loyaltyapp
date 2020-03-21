import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loyaltyappversion2/pages/HomePage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:loyaltyappversion2/firebase_services/authentication.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => new _RegisterState();
}

class _RegisterState extends State<Register> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email, _password,_phone;
  final AuthService _auth = AuthService();
  int a = 5;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(),
      body: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                validator: (input) {
                  if (input.isEmpty) {
                    return 'Provide an email';
                  }
                },
                decoration: InputDecoration(labelText: 'Email'),
                onSaved: (input) => _email = input,
              ),
              TextFormField(
                validator: (input) {
                  if (input.isEmpty) {
                    return 'Provide a phone number';
                  }
                },
                decoration: InputDecoration(labelText: 'Phone number'),
                onSaved: (input) => _phone = input,
              ),
              TextFormField(
                validator: (input) {
                  if (input.length < 6) {
                    return 'Longer password please';
                  }
                },
                decoration: InputDecoration(labelText: 'Password'),
                onSaved: (input) => _password = input,
                obscureText: false,
              ),

              RaisedButton(
                color: Colors.pink[400],
                child: Text(
                  'Register',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    print(_password);

//                                    setState(() => loading = true);
                    dynamic result = await _auth.registerWithEmailAndPassword(
                        _email, _password,_phone);
//                                    if(result == null) {
//                                        setState(() {
//                                            loading = false;
//                                            error = 'Please supply a valid email';
//                                        });
                  }
                },
              ),

//                        RaisedButton(
////                            onPressed:signUp,
//
//                            child: Text('Sign in'),
//                        ),
            ],
          )),
    );
  }

//    void signUp() async {
//        if(_formKey.currentState.validate()){
//            _formKey.currentState.save();
//            try{
//                print(_email);
//               AuthResult result= await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email.trim(), password: _password);
//
//               FirebaseUser user = result.user;
//                await usersCollection.document(user.uid).setData({
//                    'email': _email,
//                    'password': _password,
//
//                });
//
//                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
//            }catch(e){
//                print(e.message);
//            }
//        }
//    }
  void signIn() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      try {
        AuthResult user = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: _email.trim(), password: _password);
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => HomePage(user: user)));
      } catch (e) {
        print(e.message);
      }
    }
  }
}
