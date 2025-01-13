import 'dart:io' as io; // Avoid conflicts with dart:html
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';
import 'dart:html' as html;

class ResumeHelper {
  /// Downloads the resume and opens it
  static Future<void> downloadResume(BuildContext context, String assetPath) async {
    try {
      // Load the resume from assets
      final ByteData data = await rootBundle.load(assetPath);
      final Uint8List bytes = data.buffer.asUint8List();

      if (isWebPlatform()) {
        // Web: Trigger a browser download
        final blob = html.Blob([bytes]);
        final url = html.Url.createObjectUrlFromBlob(blob);
        html.AnchorElement(href: url)
          ..target = 'blank'
          ..download = 'resume.pdf'
          ..click();
        html.Url.revokeObjectUrl(url);
      } else {
        // Mobile/Desktop: Save and open the file
        final Directory tempDir = await getTemporaryDirectory();
        final io.File file = io.File('${tempDir.path}/resume.pdf');
        await file.writeAsBytes(bytes);

        // Open the file
        OpenFile.open(file.path);
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error downloading resume: $e')),
      );
    }
  }

  /// Utility function to check if the platform is web
  static bool isWebPlatform() {
    try {
      return identical(0, 0.0); // Dart runtime is Web when identical(0, 0.0) is true
    } catch (_) {
      return false;
    }
  }
}
