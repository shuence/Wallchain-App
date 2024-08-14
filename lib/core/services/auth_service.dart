import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<bool> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      print(userCredential.user);
      print(userCredential.user?.uid);
      
      User? user = userCredential.user;
      if (user != null) {
        DocumentSnapshot userDoc = await _firestore.collection('users').doc(user.uid).get();
        if (userDoc.exists) {
          String name = userDoc.get('name');
          await _saveUserSession(user.uid, email, name);
          return true;
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print("SignIn Error: $e");
      }
    }
    return false;
  }

  Future<void> signOut() async {
    await _auth.signOut();
    await _clearUserSession();
  }

  Future<void> _saveUserSession(String uid, String email, String name) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_uid', uid);
    await prefs.setString('user_email', email);
    await prefs.setString('user_name', name); 
  }

  Future<void> _clearUserSession() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('user_uid');
    await prefs.remove('user_email');
    await prefs.remove('user_name'); 
  }

  Future<Map<String, String?>> getUserSession() async {
    final prefs = await SharedPreferences.getInstance();
    return {
      'uid': prefs.getString('user_uid'),
      'email': prefs.getString('user_email'),
      'name': prefs.getString('user_name'),
    };
  }
}
