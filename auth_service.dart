import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//value notifier
ValueNotifier<AuthService> authServiceNotifier =
    ValueNotifier<AuthService>(AuthService());

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  

  // Sign in with email and password
  Future<User?> signIn(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return result.user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Register with email and password
  Future<User?> register(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return result.user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
  //RESET password
  Future<void> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      print(e.toString());
    }
  }
  //update username
  Future<void> updateUsername(String displayName) async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        await user.updateDisplayName(displayName);
        await user.reload();
      }
    } catch (e) {
      print(e.toString());
    }
  }
  //delete account by re authenticating first
  Future<void> deleteAccount(String email, String password) async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        AuthCredential credential = EmailAuthProvider.credential(
            email: email, password: password);
        await user.reauthenticateWithCredential(credential);
        await user.delete();
      }
    } catch (e) {
      print(e.toString());
    }
  }

  //reset password while logged in
  Future<void> changePassword(String newPassword) async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        await user.updatePassword(newPassword);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  // Sign out
  Future<void> signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}