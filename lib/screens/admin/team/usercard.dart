import 'package:flutter/material.dart';
import 'package:jito_visuals/auth/mongo_service.dart';
import 'package:jito_visuals/screens/admin/team/updatedialogue.dart';
import 'package:mongo_dart/mongo_dart.dart' as mongo;

class UserCard extends StatefulWidget {
  final Map<String, dynamic> user;
  final Function(String) onUserTypeChanged;

  const UserCard({Key? key, required this.user, required this.onUserTypeChanged}) : super(key: key);

  @override
  _UserCardState createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {
  final List<String> userTypes = ["BOD", "APEX", "PROJECT","ZONE", "default"];
  String? selectedUserType;

  @override
  void initState() {
    super.initState();
    selectedUserType = userTypes.contains(widget.user['userType'])
        ? widget.user['userType']
        : userTypes.first;
  }


  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Container(
        decoration: BoxDecoration(
          color: isDarkMode ? Colors.grey[900] : Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: isDarkMode ? Colors.black.withOpacity(0.3) : Colors.blue.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              // User Avatar
              CircleAvatar(
                backgroundColor: Colors.orange,
                radius: 30,
                child: Text(
                  '${widget.user['first_name']?[0]}${widget.user['last_name']?[0]}',
                  style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(width: 16),
              // User Details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            '${widget.user['first_name']} ${widget.user['last_name']}'.toUpperCase(),
                            style: TextStyle(
                              color: isDarkMode ? Colors.white : Colors.blue,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        if (widget.user['userType'] == 'admin')
                        // Show userType as text for ADMIN users
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF5A201).withOpacity(0.2),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              widget.user['userType'].toUpperCase(),
                              style: const TextStyle(
                                color: Color(0xFFF5A201),
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        else
                        // Show Dropdown for non-admin users
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF5A201).withOpacity(0.2),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                DropdownButtonHideUnderline(
                                  child: SizedBox(
                                    height: 20, // Set a fixed height to avoid extra vertical space
                                    child: DropdownButton<String>(
                                      value: selectedUserType,
                                      items: userTypes.map((String type) {
                                        return DropdownMenuItem<String>(
                                          value: type,
                                          child: Text(
                                            type.toUpperCase(),
                                            style: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xFFF5A201),
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                      onChanged: (newType) {
                                        if (newType != null && newType != selectedUserType) {
                                          showConfirmDialog(
                                            context: context,
                                            title: "Confirm Change",
                                            message: "Do you want to change the user type to $newType?",
                                            onConfirm: () async {
                                              Navigator.pop(context);
                                              String? userId = widget.user['_id'] is mongo.ObjectId
                                                  ? (widget.user['_id'] as mongo.ObjectId).toHexString()
                                                  : widget.user['_id']?.toString();
                                              bool success = await MongoService.updateUserType(context, userId!, newType);
                                              if (success) {
                                                setState(() {
                                                  selectedUserType = newType;
                                                });
                                                widget.onUserTypeChanged(newType);
                                              } else {
                                                ScaffoldMessenger.of(context).showSnackBar(
                                                  SnackBar(content: Text("Failed to update user type")),
                                                );
                                              }
                                            },
                                          );
                                        }
                                      },
                                      style: const TextStyle(fontSize: 12),
                                      dropdownColor: Colors.white,
                                      isDense: true, // Reduces default padding of dropdown
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(Icons.email_outlined, size: 16, color: Colors.grey),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            widget.user['email'] ?? '',
                            style: TextStyle(color: Colors.grey[600]),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(Icons.phone_outlined, size: 16, color: Colors.grey),
                        const SizedBox(width: 8),
                        Text(
                          '${widget.user['mobile_no']}',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
