import 'package:flutter/material.dart';
import 'package:jito_visuals/main.dart';
import 'package:jito_visuals/screens/admin/Dashboard/widgets/appbar.dart';
import 'package:jito_visuals/screens/admin/Dashboard/widgets/dashboardaction.dart';
import 'package:jito_visuals/screens/admin/Dashboard/widgets/greetingwidget.dart';
import 'package:jito_visuals/screens/admin/Dashboard/widgets/motivationalquotewidget.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final isSmallScreen = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : Colors.grey[50],
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: isSmallScreen ? 16.0 : 24.0,
          vertical: 24.0,
        ),
        child: Column(
          children: [
            DashboardAppBar(isDarkMode: isDarkMode, themeProvider: themeProvider),
            const SizedBox(height: 24),
            const GreetingWidget(),
            const SizedBox(height: 24),
            DashboardActions(isSmallScreen: isSmallScreen),
            const SizedBox(height: 24),
            const MotivationalQuoteWidget(),
          ],
        ),
      ),
    );
  }
}
