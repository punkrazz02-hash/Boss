import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/user_model.dart';
import '../local_storage_service.dart';

class AuthenticationService {
  final firebase_auth.FirebaseAuth _auth = firebase_auth.FirebaseAuth.instance;

  // Sign Up with Email & Password
  Future<User?> signUpWithEmail({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = User(
        id: userCredential.user!.uid,
        email: email,
        firstName: firstName,
        lastName: lastName,
        currency: 'INR',
        language: 'en',
        startingBalance: 0.0,
        createdAt: DateTime.now(),
        lastLogin: DateTime.now(),
        isBiometricEnabled: false,
        isTwoFactorEnabled: false,
      );

      await LocalStorageService.saveUser(user);
      return user;
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw e.message ?? 'Sign up failed';
    }
  }

  // Sign In with Email & Password
  Future<User?> signInWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // In production, fetch user details from Firestore
      final user = User(
        id: userCredential.user!.uid,
        email: userCredential.user!.email ?? '',
        firstName: 'User',
        lastName: 'Name',
        currency: 'INR',
        language: 'en',
        startingBalance: 0.0,
        createdAt: DateTime.now(),
        lastLogin: DateTime.now(),
        isBiometricEnabled: false,
        isTwoFactorEnabled: false,
      );

      await LocalStorageService.saveUser(user);
      return user;
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw e.message ?? 'Sign in failed';
    }
  }

  // Sign Out
  Future<void> signOut() async {
    try {
      await _auth.signOut();
      await LocalStorageService.deleteUser();
    } catch (e) {
      throw 'Sign out failed: $e';
    }
  }

  // Get Current User
  firebase_auth.User? getCurrentUser() {
    return _auth.currentUser;
  }

  // Check if user is authenticated
  bool isAuthenticated() {
    return _auth.currentUser != null;
  }
}

final authenticationServiceProvider = Provider((ref) {
  return AuthenticationService();
});
