import 'package:flutter/material.dart';
import 'package:jito_visuals/screens/users/APEX_TOP/apex_content.dart';

import 'auth/auth_functions.dart';
import 'screens/users/ADMIN/admin_home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ApexPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    _checkLoginAndNavigate();
  }

  Future<void> _checkLoginAndNavigate() async {
    await Future.delayed(Duration.zero); // Ensures this runs after build
    AuthFunctions().checkLoginStatus(context);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
    );
  }
}
