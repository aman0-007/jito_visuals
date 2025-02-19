import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:jito_visuals/auth/mongo_service.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  // Google Sign-In Function with MongoDB Integration
  Future<User?> signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return null; // User canceled sign-in

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential = await _auth.signInWithCredential(credential);
      final User? user = userCredential.user;

      if (user != null) {
        // Check if user exists in MongoDB
        bool userExists = await MongoService.checkIfUserExists(user.email!);

        if (!userExists) {
          // If user doesn't exist, save to MongoDB
          await MongoService.insertUserForGoogleAuth(
            context: context,
            fname: user.displayName?.split(" ")[0] ?? "",
            lname: (user.displayName != null && user.displayName!.split(" ").length > 1)
                ? user.displayName!.split(" ")[1]
                : "",
            email: user.email!,
            number: 0, // Google doesn't provide phone numbers directly
            password: "", // No password needed for Google Sign-In
          );
          await FirebaseAuth.instance.signOut();
        }
      }

      return user;
    } catch (e) {
      //print("Google Sign-In Error: $e");
      return null;
    }
  }

  // Sign-Out Function
  Future<void> signOut() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
  }
}
