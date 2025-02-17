import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jito_visuals/screens/afteronboard/afteronboard_screen.dart';
import 'package:jito_visuals/screens/contants/custom_snackbar.dart';

void showLogoutDialog(BuildContext context) {
  showDialog(
    context: context,
    // barrierDismissible: false, // Prevent closing by tapping outside
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.warning_amber_rounded, size: 40, color: Colors.red),
              SizedBox(height: 10),
              Text(
                "Logout",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                "Do you really want to logout?",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(height: 18),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 90, // Smaller button width
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context); // Close dialog
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        backgroundColor: Colors.grey[300],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text("No", style: TextStyle(color: Colors.black, fontSize: 14)),
                    ),
                  ),
                  SizedBox(
                    width: 90, // Smaller button width
                    child: TextButton(
                      onPressed: () async {
                        final box = GetStorage();
                        await box.erase(); // Clear all stored data

                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => AfteronboardScreen()),
                              (route) => false, // Remove all previous routes
                        );

                        CustomSnackbar.showSnackbar(context, "Logged out!!", backgroundColor: Colors.orange);
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text("Yes", style: TextStyle(color: Colors.white, fontSize: 14)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
