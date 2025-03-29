import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jito_visuals/screens/admin/profile/about_screen.dart';
import 'package:jito_visuals/screens/admin/profile/widget/logoutdialogue.dart';
import 'package:jito_visuals/screens/onboard/theme/colors.dart';

import '../../contants/googledrive_image.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.6, curve: Curves.easeOut),
      ),
    );

    _slideAnimation = Tween<double>(begin: 50, end: 0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.2, 0.8, curve: Curves.easeOut),
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? SplashColors.darkBlue : Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Profile',
          style: TextStyle(
            color: Color(0xFF00537A),
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(0, _slideAnimation.value),
              child: Opacity(
                opacity: _fadeAnimation.value,
                child: RefreshIndicator(
                  onRefresh: () async {
                    // Implement refresh logic here
                  },
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildProfileHeader(theme),
                          const SizedBox(height: 32),
                          _buildUserDetailsSection(context),
                          const SizedBox(height: 32),
                          _buildSettingsSection(context),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildProfileHeader(ThemeData theme) {
    final isDark = theme.brightness == Brightness.dark;
    final box = GetStorage();
    final String userType = box.read('user_data')?['userType'];
    final String? profileImageUrl = box.read('user_data')?['profile'];

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,  // Let the content determine the size
        children: [
          Hero(
            tag: 'profile_image',
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              constraints: BoxConstraints(
                maxWidth: 300,  // Optional max width
                maxHeight: 210, // Optional max height
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: SplashColors.lightBlue.withOpacity(0.1),
                border: Border.all(
                  color: SplashColors.lightBlue,
                  width: 2,
                ),
                boxShadow: [
                  BoxShadow(
                    color: SplashColors.lightBlue.withOpacity(0.2),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: GoogleDriveImageLoader(
                driveFileUrl: profileImageUrl,
                placeholderColor: SplashColors.lightBlue,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '${box.read('user_data')?['fname'] ?? ''} ${box.read('user_data')?['lname'] ?? ''}',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: isDark ? Colors.white : SplashColors.darkBlue,
            ),
          ),
          Text(
            userType.toUpperCase(),
            style: theme.textTheme.bodyMedium?.copyWith(
              color: SplashColors.brightOrange,
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildUserDetailsSection(BuildContext context) {
    // final theme = Theme.of(context);
    // final isDark = theme.brightness == Brightness.dark;
    final box = GetStorage();

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: SplashColors.lightBlue.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: SplashColors.lightBlue.withOpacity(0.1),
        ),
      ),
      child: Column(
        children: [
          _buildDetailTile(
            context,
            icon: Icons.email_outlined,
            label: 'Email',
            value: box.read('user_data')?['email'],
            //onEdit: () => _showEditDialog(context, 'Email'),
          ),
          // const Divider(height: 24),
          // _buildDetailTile(
          //   context,
          //   icon: Icons.phone_outlined,
          //   label: 'Phone',
          //   value: box.read('user_data')?['mobile_no'],
          //   //onEdit: () => _showEditDialog(context, 'Phone'),
          // ),

        ],
      ),
    );
  }

  Widget _buildDetailTile(
      BuildContext context, {
        required IconData icon,
        required String label,
        required String value,
        //required VoidCallback onEdit,
      }) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: SplashColors.lightBlue.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: SplashColors.lightBlue),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: SplashColors.brightOrange,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: isDark ? Colors.white : SplashColors.darkBlue,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSettingsSection(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Settings & Information',
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: theme.brightness == Brightness.dark
                ? Colors.white
                : SplashColors.darkBlue,
          ),
        ),
        const SizedBox(height: 16),
        _buildSettingsTile(
          context,
          title: 'About App',
          icon: Icons.info_outline,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AboutAppPage()),
            );
          },
        ),
        const SizedBox(height: 12),
        _buildSettingsTile(
          context,
          title: 'Logout',
          icon: Icons.logout,
          isDestructive: true,
          onTap: () => showLogoutDialog(context),
        ),
      ],
    );
  }

  Widget _buildSettingsTile(
      BuildContext context, {
        required String title,
        required IconData icon,
        required VoidCallback onTap,
        bool isDestructive = false,
      }) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Card(
      elevation: 0,
      color: isDark ? SplashColors.mediumBlue : Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: isDestructive
              ? theme.colorScheme.error.withOpacity(0.5)
              : SplashColors.lightBlue.withOpacity(0.1),
        ),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: isDestructive
                      ? theme.colorScheme.error.withOpacity(0.1)
                      : SplashColors.lightBlue.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  icon,
                  color: isDestructive
                      ? theme.colorScheme.error
                      : SplashColors.brightOrange,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  title,
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: isDestructive
                        ? theme.colorScheme.error
                        : (isDark ? Colors.white : SplashColors.darkBlue),
                  ),
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: isDestructive
                    ? theme.colorScheme.error
                    : SplashColors.brightOrange,
              ),
            ],
          ),
        ),
      ),
    );
  }

}