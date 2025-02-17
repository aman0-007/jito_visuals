import 'package:flutter/material.dart';

class ButtonsPage extends StatelessWidget {
  const ButtonsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? theme.scaffoldBackgroundColor : Colors.grey[50],
      appBar: AppBar(
        title: const Text('Quick Links'),
        backgroundColor: theme.colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Featured Buttons Section
              Text(
                'Featured Links',
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              GridView.count(
                crossAxisCount: MediaQuery.of(context).size.width > 600 ? 3 : 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 1.5,
                children: [
                  _buildImageButton(
                    context,
                    title: 'Documentation',
                    icon: Icons.book,
                    onTap: () {
                      // Handle tap
                    },
                  ),
                  _buildImageButton(
                    context,
                    title: 'Gallery',
                    icon: Icons.photo_library,
                    onTap: () {
                      // Handle tap
                    },
                  ),
                  _buildImageButton(
                    context,
                    title: 'Downloads',
                    icon: Icons.download,
                    onTap: () {
                      // Handle tap
                    },
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // Quick Access Buttons
              Text(
                'Quick Access',
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: [
                  _buildChipButton(
                    context,
                    label: 'Website',
                    icon: Icons.language,
                    onTap: () {
                      // Handle tap
                    },
                  ),
                  _buildChipButton(
                    context,
                    label: 'Support',
                    icon: Icons.help_outline,
                    onTap: () {
                      // Handle tap
                    },
                  ),
                  _buildChipButton(
                    context,
                    label: 'Community',
                    icon: Icons.people_outline,
                    onTap: () {
                      // Handle tap
                    },
                  ),
                  _buildChipButton(
                    context,
                    label: 'Blog',
                    icon: Icons.article_outlined,
                    onTap: () {
                      // Handle tap
                    },
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // Social Links
              Text(
                'Connect With Us',
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildIconButton(
                    context,
                    icon: Icons.facebook,
                    onTap: () {
                      // Handle tap
                    },
                  ),
                  _buildIconButton(
                    context,
                    icon: Icons.telegram,
                    onTap: () {
                      // Handle tap
                    },
                  ),
                  _buildIconButton(
                    context,
                    icon: Icons.web,
                    onTap: () {
                      // Handle tap
                    },
                  ),
                  _buildIconButton(
                    context,
                    icon: Icons.link,
                    onTap: () {
                      // Handle tap
                    },
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // Additional Links
              Text(
                'Additional Resources',
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              _buildStandardButton(
                context,
                title: 'Latest Updates',
                subtitle: 'Check out what\'s new',
                icon: Icons.new_releases_outlined,
                onTap: () {
                  // Handle tap
                },
              ),
              const SizedBox(height: 12),
              _buildStandardButton(
                context,
                title: 'FAQs',
                subtitle: 'Find answers to common questions',
                icon: Icons.question_answer_outlined,
                onTap: () {
                  // Handle tap
                },
              ),
              const SizedBox(height: 12),
              _buildStandardButton(
                context,
                title: 'Contact Us',
                subtitle: 'Get in touch with our team',
                icon: Icons.mail_outline,
                onTap: () {
                  // Handle tap
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImageButton(
      BuildContext context, {
        required String title,
        required IconData icon,
        required VoidCallback onTap,
      }) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(
              colors: [
                theme.colorScheme.primary,
                theme.colorScheme.primary.withOpacity(0.8),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: Colors.white,
                size: 32,
              ),
              const SizedBox(height: 8),
              Text(
                title,
                style: theme.textTheme.titleMedium?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildChipButton(
      BuildContext context, {
        required String label,
        required IconData icon,
        required VoidCallback onTap,
      }) {
    final theme = Theme.of(context);

    return ActionChip(
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 18,
            color: theme.colorScheme.primary,
          ),
          const SizedBox(width: 8),
          Text(label),
        ],
      ),
      backgroundColor: theme.colorScheme.primary.withOpacity(0.1),
      onPressed: onTap,
    );
  }

  Widget _buildIconButton(
      BuildContext context, {
        required IconData icon,
        required VoidCallback onTap,
      }) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(16),
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

  Widget _buildStandardButton(
      BuildContext context, {
        required String title,
        required String subtitle,
        required IconData icon,
        required VoidCallback onTap,
      }) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Card(
      elevation: 0,
      color: isDark ? theme.colorScheme.surface : Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: theme.colorScheme.primary.withOpacity(0.1),
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
                  color: theme.colorScheme.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  icon,
                  color: theme.colorScheme.primary,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      subtitle,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.primary.withOpacity(0.8),
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: theme.colorScheme.primary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}