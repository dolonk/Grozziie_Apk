import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String uid;
  final String userName;
  final String email;

  UserModel(
      {required this.uid,
        required this.userName,
        required this.email,
        });

  Map<String, dynamic> toJson() => {
    'uid': uid,
    'userName': userName,
    'email': email,
  };

  static UserModel fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return UserModel(
      uid: snapshot["uid"],
      userName: snapshot["username"],
      email: snapshot["email"],
    );
  }

}
