import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jito_visuals/firebase_options.dart';
import 'package:jito_visuals/screens/contants/splash_screen.dart';
import 'package:provider/provider.dart';
import 'auth/auth_functions.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

// Main App Widget
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: themeProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
            //home: const DashboardPage(),
            //home: const TripLinkBottomNavigation(),
            home: const SplashScreen(),
          );
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

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

class ThemeProvider extends ChangeNotifier {
  bool _isDarkMode = false;
  bool get isDarkMode => _isDarkMode;

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }
}

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: const Color(0xFF00537A),
    scaffoldBackgroundColor: const Color(0xFF013C58).withOpacity(0.05),
    colorScheme: const ColorScheme.light(
      primary: Color(0xFF00537A),
      secondary: Color(0xFFF5A201),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: const Color(0xFF00537A),
    scaffoldBackgroundColor: const Color(0xFF121212),
    colorScheme: const ColorScheme.dark(
      primary: Color(0xFF00537A),
      secondary: Color(0xFFF5A201),
    ),
  );
}
