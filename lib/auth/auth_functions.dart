import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jito_visuals/screens/afteronboard/afteronboard_screen.dart';
import 'package:jito_visuals/screens/contants/bottomnavigation.dart';
import 'package:jito_visuals/screens/contants/screen_change_anim.dart';
import '../screens/contants/custom_snackbar.dart';
import 'mongo_service.dart';

class AuthFunctions {
  final box = GetStorage();

  Future<void> signUpUser(BuildContext context, String fname, String lname, String email, int number, String password) async {
    if (fname.isEmpty || email.isEmpty || password.isEmpty || lname.isEmpty || number.isNaN) {
      CustomSnackbar.showSnackbar(context, 'All fields are required!', backgroundColor: Colors.red);
      return;
    }

    String hashedPassword = hashPassword(password);
    try {
      await MongoService.insertUser(
        context: context,
        fname: fname,
        lname: lname,
        email: email,
        number: number,
        password: hashedPassword,
      );
    } catch (e) {
      CustomSnackbar.showSnackbar(context, 'Error: $e', backgroundColor: Colors.red);
      print(e);
    }
  }

  Future<void> loginUser(BuildContext context, String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      CustomSnackbar.showSnackbar(context, 'Email and password are required!', backgroundColor: Colors.red);
      return;
    }
    String hashedPassword = hashPassword(password);

    try {
      final users = await MongoService.fetchAllUsers();
      final user = users.firstWhere(
            (user) => user['email'] == email && user['password'] == hashedPassword,
        orElse: () => {},
      );

      if (user.isEmpty) {
        CustomSnackbar.showSnackbar(context, 'Invalid email or password', backgroundColor: Colors.red);
        return;
      }

      Map<String, dynamic> userData = {
        'isLoggedIn': true,
        'userType': user['userType'],
        'fname': user['first_name'],
        'lname': user['last_name'],
        'email': user['email'],
        'mobile_no': user['mobile_no'].toString(),
      };
      await box.write('user_data', userData);
      await box.save();
      print("Stored user data: ${box.read('user_data')}");

      switch (userData['userType']) {
        case 'admin':
          CustomSnackbar.showSnackbar(context, 'Welcome back, Admin!', backgroundColor: Colors.green);
          Navigator.push(context, AnimatedPageTransition(page: TripLinkBottomNavigation(), transitionType: TransitionType.zoom));
          break;
        case 'bod':
          CustomSnackbar.showSnackbar(context, 'Welcome back, BOD!', backgroundColor: Colors.blue);
          Navigator.push(context, AnimatedPageTransition(page: TripLinkBottomNavigation(), transitionType: TransitionType.zoom));
          break;
        case 'PROJECT':
          CustomSnackbar.showSnackbar(context, 'Welcome back, BOD!', backgroundColor: Colors.blue);
          Navigator.push(context, AnimatedPageTransition(page: TripLinkBottomNavigation(), transitionType: TransitionType.zoom));
          break;
        default:
          CustomSnackbar.showSnackbar(context, 'User not verified!\nPlease contact Admin.', backgroundColor: Colors.orange);
      }
    } catch (e) {
      CustomSnackbar.showSnackbar(context, 'Error occurred while logging in: $e', backgroundColor: Colors.red);
    }
  }

  Future<void> checkLoginStatus(BuildContext context) async {
    final userData = box.read('user_data') ?? {};
    print("Stored user data at startup: $userData");

    if (userData['isLoggedIn'] == true) {
      switch (userData['userType']) {
        case 'admin':
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => TripLinkBottomNavigation()));
          break;
        case 'bod':
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const TripLinkBottomNavigation()));
          break;
        case 'PROJECT':
          CustomSnackbar.showSnackbar(context, 'Welcome back, BOD!', backgroundColor: Colors.blue);
          Navigator.push(context, AnimatedPageTransition(page: TripLinkBottomNavigation(), transitionType: TransitionType.zoom));
          break;
        default:
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AfteronboardScreen()));
      }
    } else {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AfteronboardScreen()));
    }
  }

  String hashPassword(String password) {
    var bytes = utf8.encode(password);
    var digest = sha256.convert(bytes);
    return digest.toString();
  }
}
