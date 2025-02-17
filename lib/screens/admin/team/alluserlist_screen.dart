import 'package:flutter/material.dart';
import 'package:jito_visuals/screens/admin/team/alluserlist.dart';

class AlluserlistScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? theme.scaffoldBackgroundColor : Colors.grey[50],
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
      body: Alluserlist(),
    );
  }
}