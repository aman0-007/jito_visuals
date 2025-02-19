import 'package:flutter/material.dart';

class DashboardActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback? onTap;

  const DashboardActionButton({
    required this.icon,
    required this.label,
    required this.color,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(15),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, size: 32, color: color),
                const SizedBox(height: 12),
                Text(
                  label,
                  style: TextStyle(color: color, fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
