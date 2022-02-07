import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:aarohan_app/models/user.dart';
import 'dart:convert';

class AuthService{
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final FirebaseDatabase database = FirebaseDatabase.instance;
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static final GoogleSignIn _googleSignIn = GoogleSignIn();


  // stores the user details to Firestore
  Future storeUser(User user) async{

    Map<String,String> user_data = {
      "name": user.displayName,
      "email": user.email,
      "photoURL": user.photoURL,
      "id":user.uid
    };

    Users.us =  Users.fromJson(user_data);

  }

  Future gSignIn() async{
    try {
      final GoogleSignInAccount googleSignInAccount =
      await _googleSignIn.signIn();

      final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      final UserCredential authResult =
      await _auth.signInWithCredential(credential);

      final User user = authResult.user;
      Map<String,String> user_data = {
        "name": user.displayName,
        "email": user.email,
        "photoURL": user.photoURL,
        "id":user.uid
      };

      // assert(!user.isAnonymous);
      // assert(await user.getIdToken() != null);

      final User currentUser = _auth.currentUser;
      DocumentSnapshot doc =
      await _firestore.collection("Users").doc(user.uid).get();
      if (!doc.exists) {
        _firestore.collection("Users").doc(user.uid).set(user_data);

      }

      print('Google Sign In succeeded');

      // assert(user.uid == currentUser.uid);
      //
      // assert(user.email != null);
      // assert(user.displayName != null);
      // assert(user.photoURL != null);

    } on FirebaseAuthException catch (e) {

       print(e.message);
    }
  }

  Future gSignOut() async{
    await _googleSignIn.signOut();
    await _auth.signOut();
    print("User Sign Out");
  }

  Future getUser() async{
    final User user = _auth.currentUser;
    
    // in the login page, based on the return value, the animation to be shown is decided.
     return user;
  }
}