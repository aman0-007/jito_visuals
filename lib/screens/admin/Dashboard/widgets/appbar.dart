import 'package:flutter/material.dart';
import 'package:jito_visuals/main.dart';
import 'package:jito_visuals/screens/contants/themetooglebutton.dart';

class DashboardAppBar extends StatelessWidget {
  final bool isDarkMode;
  final ThemeProvider themeProvider;

  const DashboardAppBar({
    required this.isDarkMode,
    required this.themeProvider,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Dashboard',
          style: TextStyle(
            color: Color(0xFF00537A),
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          children: [
            ThemeSwitchButton(
              isDarkMode: isDarkMode,
              onToggle: () => themeProvider.toggleTheme(),
            ),
            const SizedBox(width: 16),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications_outlined),
              color: isDarkMode ? Colors.white : const Color(0xFF00537A),
              iconSize: 28,
            ),
          ],
        ),
      ],
    );
  }
}