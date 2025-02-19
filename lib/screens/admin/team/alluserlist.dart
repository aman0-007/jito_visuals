import 'package:flutter/material.dart';
import 'package:jito_visuals/auth/mongo_service.dart';
import 'package:jito_visuals/screens/admin/team/listmodel.dart';
import 'package:provider/provider.dart';
import 'usercard.dart';

class Alluserlist extends StatelessWidget {
  const Alluserlist({super.key});

  void updateUserType(String userId, String newType, BuildContext context) async {
    try {
      await MongoService.updateUserType(context, userId, newType);
      Provider.of<UserListViewModel>(context, listen: false).fetchUsers();
    } catch (e) {
      //print("Error updating userType: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserListViewModel()..fetchUsers(),
      child: Consumer<UserListViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (viewModel.error != null) {
            return Center(child: Text('Error: ${viewModel.error}'));
          } else {
            return ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: viewModel.users.length,
              itemBuilder: (context, index) {
                final user = viewModel.users[index];
                return UserCard(
                  user: user,
                  onUserTypeChanged: (newType) {
                    updateUserType(user['_id'], newType, context);
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
