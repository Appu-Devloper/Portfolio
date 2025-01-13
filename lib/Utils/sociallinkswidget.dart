import 'package:flutter/material.dart';


import 'package:url_launcher/url_launcher.dart';

import 'downloadresume.dart';

class SocialLinksWidget extends StatelessWidget {
  final ThemeData theme;

  const SocialLinksWidget({
    super.key,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10, // Space between items
      alignment: WrapAlignment.center, // Center align the items
      children: [
        // GitHub Button
        TextButton(
          onPressed: () {
            _openUrl("https://github.com/Appu-Devloper");
          },
          child: Text(
            "GitHub",
            style: TextStyle(
              fontSize: 16,
              color: theme.colorScheme.onSurface.withOpacity(0.7),
            ),
          ),
        ),

        // Separator
        const Text("|", style: TextStyle(fontWeight: FontWeight.bold)),

        // LinkedIn Button
        TextButton(
          onPressed: () {
            _openUrl("https://www.linkedin.com/in/appu-m-19894a258/");
          },
          child: Text(
            "LinkedIn",
            style: TextStyle(
              fontSize: 16,
              color: theme.colorScheme.onSurface.withOpacity(0.7),
            ),
          ),
        ),

        // Separator
        const Text("|", style: TextStyle(fontWeight: FontWeight.bold)),

        // Resume Button
        TextButton(
          onPressed: () =>
              ResumeHelper.downloadResume(context, 'AppuMResume.pdf'),
          child: Text(
            "Resume",
            style: TextStyle(
              fontSize: 16,
              color: theme.colorScheme.onSurface.withOpacity(0.7),
            ),
          ),
        ),
      ],
    );
  }

  void _openUrl(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl((Uri.parse(url)));
    } else {
      throw 'Could not launch $url';
    }
  }
}
