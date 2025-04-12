import 'package:flutter/material.dart';
import 'package:jito_visuals/screens/onboard/theme/colors.dart';
import '../../contants/googledrive_image.dart';
import '../../webview/webview_route.dart';

class ApexviewScreen extends StatelessWidget {
  const ApexviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDark ? theme.scaffoldBackgroundColor : Colors.grey[50],
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            Expanded(
              child: GridView.count(
                crossAxisCount: MediaQuery.of(context).size.width > 600 ? 3 : 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 1.3,
                children: [
                  _buildImageButton(
                    context,
                    "Events Overview",
                    "https://drive.google.com/file/d/1FBFYHSjqJraNtXH226cREH_Klf_bdspu/view?usp=drive_link",
                    "https://app.powerbi.com/view?r=eyJrIjoiM2NkYTI0ZGYtMjY5ZS00YjMyLThjNWUtYzZlMzlhODdhNTk3IiwidCI6IjJmNjE4ZGE1LTM1ZGMtNGNhMC1iZWRlLTM4NWJkMmU5NjUwMSJ9",
                  ),
                  // _buildIconButton(
                  //   context,
                  //   "APEX Scorecard",
                  //   Icons.dashboard,
                  //   "https://app.powerbi.com/view?r=eyJrIjoiM2NkYTI0ZGYtMjY5ZS00YjMyLThjNWUtYzZlMzlhODdhNTk3IiwidCI6IjJmNjE4ZGE1LTM1ZGMtNGNhMC1iZWRlLTM4NWJkMmU5NjUwMSJ9",
                  // ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageButton(BuildContext context, String text, String imageUrl, String url) {
    return _buildButton(
      context,
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12), // Optional: for rounded corners
              child: GoogleDriveImageLoader(
                driveFileUrl: imageUrl,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.1),
                  Colors.black.withOpacity(0.7),
                ],
              ),
              borderRadius: BorderRadius.circular(12), // Match the image rounding
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                text,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
      url: url,
      text: text,
    );
  }

  // Widget _buildIconButton(BuildContext context, String text, IconData icon, String url) {
  //   return _buildButton(
  //     context,
  //     child: Column(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children: [
  //         Icon(
  //           icon,
  //           size: 32,
  //           color: SplashColors.lightOrange,
  //         ),
  //         const SizedBox(height: 12),
  //         Text(
  //           text,
  //           textAlign: TextAlign.center,
  //           style: const TextStyle(
  //             color: Colors.white,
  //             fontSize: 16,
  //             fontWeight: FontWeight.w500,
  //           ),
  //         ),
  //       ],
  //     ),
  //     url: url,
  //     text: text,
  //   );
  // }

  Widget _buildButton(BuildContext context, {required Widget child, required String url, required String text,}) {
    return Material(
      color: SplashColors.mediumBlue,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          Navigator.of(context).push(CustomWebViewPageRoute(
            url: url,
            title: text,
          ));
        },
        child: child,
      ),
    );
  }
}