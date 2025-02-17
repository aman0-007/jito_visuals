
import 'package:jito_visuals/auth/mongo_service.dart';

class UserRepository {
  Future<List<Map<String, dynamic>>> getUsers() async {
    return await MongoService.fetchAllUsers();
  }
}
