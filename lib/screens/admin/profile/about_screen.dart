import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutAppPage extends StatelessWidget {
  const AboutAppPage({super.key});

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryColor = theme.colorScheme.primary; // #00537A
    final secondaryColor = theme.colorScheme.secondary; // #F5A201
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : Colors.grey[50],
      appBar: AppBar(
        title: const Text('About Our App'),
        backgroundColor: primaryColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gradient Header with App Logo
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    primaryColor,
                    primaryColor.withOpacity(0.6),
                  ],
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.apps,
                      size: 60,
                      color: primaryColor,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'JITO VISUALS',
                    style: theme.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 1.5,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Version 1.0.0 (Build 100)',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: Colors.white.withOpacity(0.8),
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),

            // Quick Stats Section
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
              child: _buildStatsCard(
                context,
                primaryColor: primaryColor,
                secondaryColor: secondaryColor,
                isDarkMode: isDarkMode,
              ),
            ),
            const SizedBox(height: 24),

            // About App Description
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: _buildSectionCard(
                context,
                title: 'About',
                icon: Icons.info_outline,
                primaryColor: primaryColor,
                isDarkMode: isDarkMode,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Your app description goes here. Make it engaging and informative, highlighting the main purpose and value proposition of your application.',
                      style: theme.textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Key Features:',
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: secondaryColor,
                      ),
                    ),
                    const SizedBox(height: 8),
                    _buildFeatureItem(context, 'Feature 1: Comprehensive description of your first main feature', secondaryColor),
                    _buildFeatureItem(context, 'Feature 2: Detailed explanation of your second feature', secondaryColor),
                    _buildFeatureItem(context, 'Feature 3: Clear description of your third main feature', secondaryColor),
                    _buildFeatureItem(context, 'Feature 4: Information about your fourth feature', secondaryColor),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Version Information
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: _buildSectionCard(
                context,
                title: 'Version Information',
                icon: Icons.history,
                primaryColor: primaryColor,
                isDarkMode: isDarkMode,
                child: Column(
                  children: [
                    _buildVersionDetailRow(
                      context,
                      label: 'Current Version',
                      value: '1.0.0',
                      primaryColor: primaryColor,
                    ),
                    _buildDivider(),
                    _buildVersionDetailRow(
                      context,
                      label: 'Build Number',
                      value: '100',
                      primaryColor: primaryColor,
                    ),
                    _buildDivider(),
                    _buildVersionDetailRow(
                      context,
                      label: 'Last Updated',
                      value: 'February 14, 2024',
                      primaryColor: primaryColor,
                    ),
                    _buildDivider(),
                    _buildVersionDetailRow(
                      context,
                      label: 'Platform',
                      value: 'Android & iOS',
                      primaryColor: primaryColor,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Developer Information
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: _buildSectionCard(
                context,
                title: 'Developer',
                icon: Icons.business,
                primaryColor: primaryColor,
                isDarkMode: isDarkMode,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildDeveloperDetailRow(
                      context,
                      label: 'Company',
                      value: 'Your Company Name',
                      primaryColor: primaryColor,
                    ),
                    _buildDivider(),
                    _buildDeveloperDetailRow(
                      context,
                      label: 'Website',
                      value: 'www.yourwebsite.com',
                      isLink: true,
                      primaryColor: primaryColor,
                      secondaryColor: secondaryColor,
                    ),
                    _buildDivider(),
                    _buildDeveloperDetailRow(
                      context,
                      label: 'Email',
                      value: 'esupport@jito.org',
                      isLink: true,
                      primaryColor: primaryColor,
                      secondaryColor: secondaryColor,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Support & Links
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: _buildSectionCard(
                context,
                title: 'Support & Links',
                icon: Icons.support_agent,
                primaryColor: primaryColor,
                isDarkMode: isDarkMode,
                child: Column(
                  children: [
                    _buildLinkButton(
                      context,
                      icon: Icons.help_outline,
                      title: 'Help Center',
                      primaryColor: primaryColor,
                      onTap: () => _launchURL('https://help.yourapp.com'),
                    ),
                    _buildDivider(),
                    _buildLinkButton(
                      context,
                      icon: Icons.privacy_tip_outlined,
                      title: 'Privacy Policy',
                      primaryColor: primaryColor,
                      onTap: () => _launchURL('https://yourapp.com/privacy'),
                    ),
                    _buildDivider(),
                    _buildLinkButton(
                      context,
                      icon: Icons.description_outlined,
                      title: 'Terms of Service',
                      primaryColor: primaryColor,
                      onTap: () => _launchURL('https://yourapp.com/terms'),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Social Links
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: _buildSectionCard(
                context,
                title: 'Connect With Us',
                icon: Icons.share,
                primaryColor: primaryColor,
                isDarkMode: isDarkMode,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildSocialButton(
                      context,
                      icon: Icons.facebook,
                      primaryColor: primaryColor,
                      secondaryColor: secondaryColor,
                      onTap: () => _launchURL('https://facebook.com/yourapp'),
                    ),
                    _buildSocialButton(
                      context,
                      icon: Icons.webhook,
                      primaryColor: primaryColor,
                      secondaryColor: secondaryColor,
                      onTap: () => _launchURL('https://twitter.com/yourapp'),
                    ),
                    _buildSocialButton(
                      context,
                      icon: Icons.link,
                      primaryColor: primaryColor,
                      secondaryColor: secondaryColor,
                      onTap: () => _launchURL('https://linkedin.com/company/yourapp'),
                    ),
                    _buildSocialButton(
                      context,
                      icon: Icons.camera_alt,
                      primaryColor: primaryColor,
                      secondaryColor: secondaryColor,
                      onTap: () => _launchURL('https://instagram.com/yourapp'),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 36),

            // Footer copyright
            Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 24.0),
                child: Text(
                  '© ${DateTime.now().year} JITO Visuals. All rights reserved.',
                  style: TextStyle(
                    color: isDarkMode ? Colors.white70 : Colors.black54,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatsCard(
      BuildContext context, {
        required Color primaryColor,
        required Color secondaryColor,
        required bool isDarkMode,
      }) {
    // final backgroundColor = isDarkMode
    //     ? Colors.grey[850]
    //     : Colors.white;

    return Card(
      elevation: 4,
      shadowColor: Colors.black26,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.analytics_outlined,
                  color: secondaryColor,
                  size: 24,
                ),
                const SizedBox(width: 10),
                Text(
                  'Quick Stats',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildStatItem(
                  context,
                  icon: Icons.star,
                  value: '4.8',
                  label: 'Rating',
                  primaryColor: primaryColor,
                  secondaryColor: secondaryColor,
                ),
                _buildVerticalDivider(height: 70, isDarkMode: isDarkMode),
                _buildStatItem(
                  context,
                  icon: Icons.download,
                  value: '10K+',
                  label: 'Downloads',
                  primaryColor: primaryColor,
                  secondaryColor: secondaryColor,
                ),
                _buildVerticalDivider(height: 70, isDarkMode: isDarkMode),
                _buildStatItem(
                  context,
                  icon: Icons.people,
                  value: '5K+',
                  label: 'Users',
                  primaryColor: primaryColor,
                  secondaryColor: secondaryColor,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVerticalDivider({required double height, required bool isDarkMode}) {
    return Container(
      height: height,
      width: 1,
      color: isDarkMode ? Colors.grey[700] : Colors.grey[300],
    );
  }

  Widget _buildDivider() {
    return const Divider(height: 24, thickness: 0.5);
  }

  Widget _buildSectionCard(
      BuildContext context, {
        required String title,
        required IconData icon,
        required Widget child,
        required Color primaryColor,
        required bool isDarkMode,
      }) {
    // final backgroundColor = isDarkMode
    //     ? Colors.grey[850]
    //     : Colors.white;

    return Card(
      elevation: 4,
      shadowColor: Colors.black26,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  color: primaryColor,
                  size: 24,
                ),
                const SizedBox(width: 10),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            child,
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(
      BuildContext context, {
        required IconData icon,
        required String value,
        required String label,
        required Color primaryColor,
        required Color secondaryColor,
      }) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: primaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            icon,
            color: secondaryColor,
            size: 24,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          value,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: primaryColor,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }

  Widget _buildVersionDetailRow(
      BuildContext context, {
        required String label,
        required String value,
        required Color primaryColor,
      }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.grey[600],
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: primaryColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureItem(BuildContext context, String description, Color secondaryColor) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.check_circle,
            size: 20,
            color: secondaryColor,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              description,
              style: const TextStyle(height: 1.4),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDeveloperDetailRow(
      BuildContext context, {
        required String label,
        required String value,
        required Color primaryColor,
        Color? secondaryColor,
        bool isLink = false,
      }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.grey[600],
            ),
          ),
          isLink
              ? GestureDetector(
            onTap: () => _launchURL(value.startsWith('www')
                ? 'https://$value'
                : value.contains('@') ? 'mailto:$value' : value),
            child: Text(
              value,
              style: TextStyle(
                color: secondaryColor,
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.w500,
              ),
            ),
          )
              : Text(
            value,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: primaryColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLinkButton(
      BuildContext context, {
        required IconData icon,
        required String title,
        required VoidCallback onTap,
        required Color primaryColor,
      }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: primaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                icon,
                color: primaryColor,
                size: 20,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: primaryColor,
              size: 16,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialButton(
      BuildContext context, {
        required IconData icon,
        required VoidCallback onTap,
        required Color primaryColor,
        required Color secondaryColor,
      }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              primaryColor,
              primaryColor.withOpacity(0.8),
            ],
          ),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: primaryColor.withOpacity(0.3),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Icon(
          icon,
          color: Colors.white,
          size: 22,
        ),
      ),
    );
  }
}