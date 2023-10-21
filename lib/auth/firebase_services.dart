import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseServices {
  static saveUser(String uid, name, email, phonenumber, password) async {
    await FirebaseFirestore.instance.collection('user').doc(uid).set({
      'emailAddress': email,
      'username': name,
      'phone': phonenumber,
      'password': password
    });
  }
}
