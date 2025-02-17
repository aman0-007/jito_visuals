import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutAppPage extends StatelessWidget {
  const AboutAppPage({Key? key}) : super(key: key);

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? theme.scaffoldBackgroundColor : Colors.grey[50],
      appBar: AppBar(
        title: const Text('About App'),
        backgroundColor: theme.colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // App Logo and Name
              Center(
                child: Column(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Icon(
                        Icons.apps,
                        size: 50,
                        color: theme.colorScheme.primary,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Your App Name',
                      style: theme.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: theme.colorScheme.primary,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Quick Stats Section
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Quick Stats',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildStatItem(
                          context,
                          icon: Icons.star,
                          value: '4.8',
                          label: 'Rating',
                        ),
                        _buildStatItem(
                          context,
                          icon: Icons.download,
                          value: '10K+',
                          label: 'Downloads',
                        ),
                        _buildStatItem(
                          context,
                          icon: Icons.people,
                          value: '5K+',
                          label: 'Users',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Version Information
              _buildSectionCard(
                context,
                title: 'Version Information',
                child: Column(
                  children: [
                    _buildVersionDetailRow(
                      context,
                      label: 'Current Version',
                      value: '1.0.0',
                    ),
                    const SizedBox(height: 12),
                    _buildVersionDetailRow(
                      context,
                      label: 'Build Number',
                      value: '100',
                    ),
                    const SizedBox(height: 12),
                    _buildVersionDetailRow(
                      context,
                      label: 'Last Updated',
                      value: 'February 14, 2024',
                    ),
                    const SizedBox(height: 12),
                    _buildVersionDetailRow(
                      context,
                      label: 'Platform',
                      value: 'Android & iOS',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // About App Description
              _buildSectionCard(
                context,
                title: 'About',
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
                      ),
                    ),
                    const SizedBox(height: 8),
                    _buildFeatureItem(context, 'Feature 1: Comprehensive description of your first main feature'),
                    _buildFeatureItem(context, 'Feature 2: Detailed explanation of your second feature'),
                    _buildFeatureItem(context, 'Feature 3: Clear description of your third main feature'),
                    _buildFeatureItem(context, 'Feature 4: Information about your fourth feature'),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Developer Information
              _buildSectionCard(
                context,
                title: 'Developer',
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildDeveloperDetailRow(
                      context,
                      label: 'Company',
                      value: 'Your Company Name',
                    ),
                    const SizedBox(height: 12),
                    _buildDeveloperDetailRow(
                      context,
                      label: 'Website',
                      value: 'www.yourwebsite.com',
                      isLink: true,
                    ),
                    const SizedBox(height: 12),
                    _buildDeveloperDetailRow(
                      context,
                      label: 'Email',
                      value: 'support@yourapp.com',
                      isLink: true,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Support & Links
              _buildSectionCard(
                context,
                title: 'Support & Links',
                child: Column(
                  children: [
                    _buildLinkButton(
                      context,
                      icon: Icons.help_outline,
                      title: 'Help Center',
                      onTap: () => _launchURL('https://help.yourapp.com'),
                    ),
                    _buildLinkButton(
                      context,
                      icon: Icons.privacy_tip_outlined,
                      title: 'Privacy Policy',
                      onTap: () => _launchURL('https://yourapp.com/privacy'),
                    ),
                    _buildLinkButton(
                      context,
                      icon: Icons.description_outlined,
                      title: 'Terms of Service',
                      onTap: () => _launchURL('https://yourapp.com/terms'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Social Links
              _buildSectionCard(
                context,
                title: 'Connect With Us',
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildSocialButton(
                      context,
                      icon: Icons.facebook,
                      onTap: () => _launchURL('https://facebook.com/yourapp'),
                    ),
                    _buildSocialButton(
                      context,
                      icon: Icons.webhook,
                      onTap: () => _launchURL('https://twitter.com/yourapp'),
                    ),
                    _buildSocialButton(
                      context,
                      icon: Icons.link,
                      onTap: () => _launchURL('https://linkedin.com/company/yourapp'),
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

  Widget _buildSectionCard(
      BuildContext context, {
        required String title,
        required Widget child,
      }) {
    final theme = Theme.of(context);

    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: theme.colorScheme.primary.withOpacity(0.1),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
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
      }) {
    final theme = Theme.of(context);

    return Column(
      children: [
        Icon(
          icon,
          color: theme.colorScheme.primary,
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: theme.textTheme.bodySmall,
        ),
      ],
    );
  }

  Widget _buildVersionDetailRow(
      BuildContext context, {
        required String label,
        required String value,
      }) {
    final theme = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.primary,
          ),
        ),
        Text(
          value,
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildFeatureItem(BuildContext context, String description) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(left: 8, bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.check_circle,
            size: 20,
            color: theme.colorScheme.primary,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              description,
              style: theme.textTheme.bodyMedium,
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
        bool isLink = false,
      }) {
    final theme = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.primary,
          ),
        ),
        isLink
            ? GestureDetector(
          onTap: () => _launchURL(value.startsWith('www') ? 'https://$value' : 'mailto:$value'),
          child: Text(
            value,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.secondary,
              decoration: TextDecoration.underline,
            ),
          ),
        )
            : Text(
          value,
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildLinkButton(
      BuildContext context, {
        required IconData icon,
        required String title,
        required VoidCallback onTap,
      }) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            Icon(
              icon,
              color: theme.colorScheme.primary,
              size: 24,
            ),
            const SizedBox(width: 16),
            Text(
              title,
              style: theme.textTheme.bodyLarge,
            ),
            const Spacer(),
            Icon(
              Icons.arrow_forward_ios,
              color: theme.colorScheme.primary,
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
      }) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: theme.colorScheme.primary.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(
          icon,
          color: theme.colorScheme.primary,
          size: 24,
        ),
      ),
    );
  }
}