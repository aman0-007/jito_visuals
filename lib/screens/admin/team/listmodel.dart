import 'package:flutter/material.dart';
import 'package:jito_visuals/screens/admin/team/userrepo.dart';

class UserListViewModel extends ChangeNotifier {
  final UserRepository _repository = UserRepository();
  List<Map<String, dynamic>> _users = [];
  bool _isLoading = true;
  String? _error;

  List<Map<String, dynamic>> get users => _users;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> fetchUsers() async {
    _isLoading = true;
    notifyListeners();

    try {
      _users = await _repository.getUsers();
      _error = null;
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
