import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../data_layer/models/userModel.dart';

class AuthMethod {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  Future<UserModel> getUserDetails() async {
    User currentUser = _auth.currentUser!;
    DocumentSnapshot snap =
        await _fireStore.collection('users').doc(currentUser.uid).get();
    return UserModel.fromSnap(snap);
  }

  // Sing up firebase Auth
  Future<String> signUpUser({
    required String userName,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    String res = 'Some error occurred';
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          userName.isNotEmpty ||
          confirmPassword.isNotEmpty) {
        // Register User
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        UserModel userModel = UserModel(
          userName: userName,
          uid: cred.user!.uid,
          email: email,
        );
        await Future.delayed(const Duration(seconds: 2));
        // Add user to our database
        await _fireStore
            .collection('users')
            .doc(cred.user!.uid)
            .set(userModel.toJson());
        res = 'Success';
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  // Login in user
  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = "Some error Occurred";
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        // logging in user with email and password
        await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        res = "Login success";
      } else {
        res = "Please enter all the fields";
      }
    } catch (err) {
      return err.toString();
    }
    return res;
  }
}
