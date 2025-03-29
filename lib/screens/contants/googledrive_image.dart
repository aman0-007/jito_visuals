import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart';

class GoogleDriveImageLoader extends StatelessWidget {
  final String? driveFileUrl;
  final Color placeholderColor;

  const GoogleDriveImageLoader({
    Key? key,
    required this.driveFileUrl,
    this.placeholderColor = Colors.blue,
  }) : super(key: key);

  // Convert Google Drive view link to direct download link
  String _convertToDriveDirectLink(String? originalUrl) {
    if (originalUrl == null || originalUrl.isEmpty) return '';

    // Extract file ID from the original URL
    final RegExp fileIdRegex = RegExp(r'/d/([^/]+)/');
    final match = fileIdRegex.firstMatch(originalUrl);

    if (match == null) return originalUrl;

    final fileId = match.group(1);
    return 'https://drive.google.com/uc?export=view&id=$fileId';
  }

  @override
  Widget build(BuildContext context) {
    final directImageUrl = _convertToDriveDirectLink(driveFileUrl);

    if (directImageUrl.isEmpty) {
      return Icon(
        Icons.person,
        size: 60,
        color: placeholderColor,
      );
    }

    return CachedNetworkImage(
      imageUrl: directImageUrl,
      fit: BoxFit.cover,  // This will make the image cover the container and maintain its aspect ratio
      placeholder: (context, url) => Center(
        child: CircularProgressIndicator(
          color: placeholderColor,
        ),
      ),
      errorWidget: (context, url, error) {
        print('Image loading error for URL $url: $error');
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.grey[200],
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.error_outline,
                  color: placeholderColor,
                  size: 40,
                ),
                SizedBox(height: 8),
                Text(
                  'Failed to load image',
                  style: TextStyle(color: placeholderColor),
                ),
              ],
            ),
          ),
        );
      },
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,  // This ensures the image covers the space while maintaining its aspect ratio
          ),
        ),
      ),
    );
  }
}
