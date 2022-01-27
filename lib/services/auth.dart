import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gdg_gallery_app_prototype/Models/FBUser.dart';
import 'package:gdg_gallery_app_prototype/services/database.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create user obj based on firebase user
  FBUser? _userFromFirebaseUser(User? user) {
    return (user!=null) ? FBUser(uid: user.uid) : null;
  }

  //auth change user stream
  Stream<User?> get user {
    return _auth.authStateChanges();
  }



  //sign in annonymously
  Future signInAnon() async {
    try{
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userFromFirebaseUser(user);
    }catch(e){
        print(e.toString());
        return null;
    }
  }

  Future signOut() async{
    try{
      return await _auth.signOut();
    }catch(e){
      print(e.toString());
      return null;
    }
  }


  //sign in mail and password



  //register mail and password
  Future registerWithEmailAndPassword(String mail, String pass) async {
    try{
      UserCredential res = await _auth.createUserWithEmailAndPassword(email: mail, password: pass);

      await DatabaseService(uid:res.user!.uid).newUser(mail, pass);

      return _userFromFirebaseUser(res.user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  Future signInWithEmailAndPassword(String mail, String pass) async {
    try{
      UserCredential res = await _auth.signInWithEmailAndPassword(email: mail, password: pass);
      return _userFromFirebaseUser(res.user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  //signout



}
