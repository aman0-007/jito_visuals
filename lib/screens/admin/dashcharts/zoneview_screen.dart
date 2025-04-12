import 'package:flutter/material.dart';
import 'package:jito_visuals/screens/onboard/theme/colors.dart';
import '../../contants/googledrive_image.dart';
import '../../webview/webview_route.dart';

class ZoneviewScreen extends StatelessWidget {
  const ZoneviewScreen({super.key});

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
                  // _buildIconButton(
                  //   context,
                  //   "APEX Scorecard",
                  //   Icons.dashboard,
                  //   "https://app.powerbi.com/view?r=eyJrIjoiM2NkYTI0ZGYtMjY5ZS00YjMyLThjNWUtYzZlMzlhODdhNTk3IiwidCI6IjJmNjE4ZGE1LTM1ZGMtNGNhMC1iZWRlLTM4NWJkMmU5NjUwMSJ9",
                  // ),
                  _buildImageButton(
                    context,
                    "GUJARAT ZONE Events Overview",
                    "https://drive.google.com/uc?export=view&id=1aetyD0mdtuLfOcMr90Ez-ROkrNeZ4sDI",
                    "https://app.powerbi.com/view?r=eyJrIjoiZmJiMjE0MzktOGRhNi00OGJkLTkzZjAtYWYwODMwZjM2ZDFkIiwidCI6IjJmNjE4ZGE1LTM1ZGMtNGNhMC1iZWRlLTM4NWJkMmU5NjUwMSJ9",
                  ),

                  _buildImageButton(
                    context,
                    "MUMBAI ZONE Events Overview",
                    "https://drive.google.com/uc?export=view&id=16bxaeokv6X95YxEYBIUMykXJGKmkJog9",
                    "https://app.powerbi.com/view?r=eyJrIjoiNGJhNDhjMDEtOGJkMi00YjQ3LThiZTgtMjM2YTA3Yjc5NWZhIiwidCI6IjJmNjE4ZGE1LTM1ZGMtNGNhMC1iZWRlLTM4NWJkMmU5NjUwMSJ9",
                  ),
                  _buildImageButton(
                    context,
                    "TNAPTS ZONE Events Overview",
                    "https://drive.google.com/uc?export=view&id=162i0QxrtDFamX09UwbmWPbKsedz9qggD",
                    "https://app.powerbi.com/view?r=eyJrIjoiODJjNzdiZWItMDI3NS00N2NmLTllMDY…",
                  ),
                  _buildImageButton(
                    context,
                    "EAST ZONE Events Overview",
                    "https://drive.google.com/uc?export=view&id=1-jPtLnf1nbSRSMjhS1Ft5hdjBP0w3RR-",
                    "https://app.powerbi.com/view?r=eyJrIjoiNTQwYjBjZjMtZTEzNS00NDExLWE4YmE…",
                  ),
                  _buildImageButton(
                    context,
                    "KKG ZONE Events Overview",
                    "https://drive.google.com/uc?export=view&id=1Y1E6i6cJ26JycAH8IidapA6bt1REG9Rx",
                    "https://app.powerbi.com/view?r=eyJrIjoiYTQ4OTRlN2UtMzc1Ny00ZTVjLTkzY2E…",
                  ),
                  _buildImageButton(
                    context,
                    "MPCG ZONE Events Overview",
                    "https://drive.google.com/uc?export=view&id=1QZLVZ5pGDRmYEnD6QqSrp2NAFznEu3k5",
                    "https://app.powerbi.com/view?r=eyJrIjoiZGFjMWI2MmYtYTMyMC00MzJiLTkyZDE…",
                  ),
                  _buildImageButton(
                    context,
                    "NORTH ZONE Events Overview",
                    "https://drive.google.com/uc?export=view&id=1Dbw3t5BJ68ckqSJ1h1BI14ivy8sIZgEu",
                    "https://app.powerbi.com/view?r=eyJrIjoiYzU3NmQyMGYtZmQzMS00MDFlLTlmMDU…",
                  ),
                  _buildImageButton(
                    context,
                    "RAJASTHAN ZONE Events Overview",
                    "https://drive.google.com/uc?export=view&id=165D1YcgUa3VUNAd3HbfpEAxbc8InNT0h",
                    "https://app.powerbi.com/view?r=eyJrIjoiNjRjMjQ1ZmEtY2JlZS00YzE3LTg3NzQ…",
                  ),
                  _buildImageButton(
                    context,
                    "ROM ZONE Events Overview",
                    "https://drive.google.com/uc?export=view&id=1AYNkTLx28ZXkxVjlTlhdpMr6UdVPCnwZ",
                    "https://app.powerbi.com/view?r=eyJrIjoiZTUwNjI5NzctNjdlNi00ZDIyLTk1ODc…",
                  ),
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