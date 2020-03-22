import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:loyaltyappversion2/actors/user.dart';


class DatabaseService {

  final String uid;
  DatabaseService({ this.uid });

  // collection reference
  final CollectionReference usersCollection = Firestore.instance.collection('userData');

  Future<void> updateUserData(String email, String password,String phone) async {
    return await usersCollection.document(uid).setData({
      'email': email,
      'password': password,
      'phone' : phone,
    });
  }



}