import 'package:mongo_dart/mongo_dart.dart';
import 'package:flutter/material.dart';
import '../screens/contants/custom_snackbar.dart';

class MongoService {
  static const _mongoUri = "mongodb+srv://aman:Aman007@cluster0.m5lef.mongodb.net/Cluster0?retryWrites=true&w=majority";
  //static const _dbName = "Cluster0";
  static const _collectionName = "jito_users";

  static Future<Map<String, dynamic>?> getUserByEmail(String email) async {
    var db = await Db.create(_mongoUri);
    try {
      await db.open();
      var collection = db.collection(_collectionName);

      var user = await collection.findOne(where.eq('email', email));

      return user; // Returns user details or null if not found
    } catch (e) {
      //print("Error fetching user by email: $e");
      return null;
    } finally {
      await db.close();
    }
  }

  static Future<bool> checkIfUserExists(String email) async {
    var db = await Db.create(_mongoUri);
    try {
      await db.open();
      var collection = db.collection(_collectionName);

      var existingUser = await collection.findOne(where.eq('email', email));
      return existingUser != null;
    } catch (e) {
      //print("Error checking user in MongoDB: $e");
      return false;
    } finally {
      await db.close();
    }
  }

  static Future<void> insertUser({
    required BuildContext context,
    required String fname,
    required String lname,
    required int number,
    required String email,
    required String password,
  }) async {
    var db = await Db.create(_mongoUri);
    try {
      await db.open();
      //print('Connected to MongoDB');

      var collection = db.collection(_collectionName);

      var existingUser = await collection.findOne(
          where.eq('email', email).or(where.eq('mobile_no', number))
      );

      if (existingUser != null) {
        if (existingUser['email'] == email) {
          CustomSnackbar.showSnackbar(context, 'Email already exists!', backgroundColor: Colors.red);
        } else {
          CustomSnackbar.showSnackbar(context, 'Mobile number already exists!', backgroundColor: Colors.red);
        }
        return;
      }

      await collection.insertOne({
        "first_name": fname,
        "last_name": lname,
        "email": email,
        "mobile_no": number,
        "password": password,
        "userType": "default",
        "createdAt": DateTime.now().toUtc().toIso8601String(),
        "dashlink": "none",
        "profile": "none"
      });

      CustomSnackbar.showSnackbar(context, 'User registered successfully!', backgroundColor: Colors.green);
    } catch (e) {
      CustomSnackbar.showSnackbar(context, 'Error occurred while registering: $e', backgroundColor: Colors.red);
      //print('MongoDB Insert Error: $e');
    } finally {
      await db.close();
    }
  }

  static Future<void> insertUserForGoogleAuth({
    required BuildContext context,
    required String fname,
    required String lname,
    required int number,
    required String email,
    required String password,
  }) async {
    var db = await Db.create(_mongoUri);
    try {
      await db.open();
      //print('Connected to MongoDB');

      var collection = db.collection(_collectionName);

      var existingUser = await collection.findOne(
          where.eq('email', email)
      );

      if (existingUser != null) {
        if (existingUser['email'] == email) {
          CustomSnackbar.showSnackbar(context, 'Email already exists!', backgroundColor: Colors.red);
        }
        return;
      }

      await collection.insertOne({
        "first_name": fname,
        "last_name": lname,
        "email": email,
        "mobile_no": number,
        "password": password,
        "userType": "default",
        "createdAt": DateTime.now().toUtc().toIso8601String(),
      });

      CustomSnackbar.showSnackbar(context, 'User registered successfully!', backgroundColor: Colors.green);
    } catch (e) {
      CustomSnackbar.showSnackbar(context, 'Error occurred while registering: $e', backgroundColor: Colors.red);
    } finally {
      await db.close();
    }
  }

  static Future<List<Map<String, dynamic>>> fetchAllUsers() async {
    var db = await Db.create(_mongoUri);
    try {
      await db.open();
      //print('Connected to MongoDB');

      var collection = db.collection(_collectionName);
      final users = await collection.find().toList();

      return users.map((user) => Map<String, dynamic>.from(user)).toList();
    } catch (e) {
      //print('Error fetching users: $e');
      return [];
    } finally {
      await db.close();
    }
  }


  static Future<bool> updateUserType(BuildContext context, String userId, String newType) async {
    var db = await Db.create(_mongoUri);
    try {
      await db.open();
      var collection = db.collection(_collectionName);

      final result = await collection.updateOne(
        where.id(ObjectId.fromHexString(userId)),
        modify.set('userType', newType),
      );

      if (result.isAcknowledged) {
        CustomSnackbar.showSnackbar(context, 'User type updated successfully!', backgroundColor: Colors.green);
        return true;
      } else {
        CustomSnackbar.showSnackbar(context, 'Error while updating the user!', backgroundColor: Colors.red);
        return false;
      }
    } catch (e) {
      //print("Error updating user type: $e");
      CustomSnackbar.showSnackbar(context, 'Database error occurred!', backgroundColor: Colors.red);
      return false;
    } finally {
      await db.close();
    }
  }
}
