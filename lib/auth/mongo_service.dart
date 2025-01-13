import 'package:mongo_dart/mongo_dart.dart';

class MongoService {
  static const _mongoUri = "mongodb+srv://aman:Aman007@cluster0.m5lef.mongodb.net/Cluster0?retryWrites=true&w=majority";
  static const _dbName = "Cluster0";
  static const _collectionName = "jito_users";

  static Future<void> insertUser({
    required String name,
    required String email,
    required String password,
    required String usertype,
  }) async {
    var db = await Db.create(_mongoUri);
    try {
      await db.open();
      print('Connected to MongoDB');

      var collection = db.collection(_collectionName);

      await collection.insert({
        "name": name,
        "email": email,
        "password": password,
        "userType": usertype,
      });

      print("User inserted successfully!");
    } catch (e) {
      print('MongoDB Connection Error: $e');
    } finally {
      await db.close();
      print('Closed.......');
    }
  }

  static Future<List<Map<String, dynamic>>> fetchAllUsers() async {
    var db = await Db.create(_mongoUri);
    try {
      await db.open();
      print('Connected to MongoDB');

      var collection = db.collection(_collectionName);
      final users = await collection.find().toList();

      return users;
    } catch (e) {
      print('Error fetching users: $e');
      return [];
    } finally {
      await db.close();
    }
  }
}
