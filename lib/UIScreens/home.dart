import 'package:flutter/material.dart';
import 'package:project_3d/Utils/Imageeffect.dart';
import '../Utils/sociallinkswidget.dart';

class HomeSection extends StatelessWidget {
  final double screenWidth;

  const HomeSection({super.key, required this.screenWidth});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Appu M',
                    style: TextStyle(
                      fontSize: screenWidth < 400
                          ? 28
                          : screenWidth < 600
                              ? 34
                              : 45,
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Software Development\nEngineer',
                    style: TextStyle(
                      fontSize: screenWidth < 400
                          ? 24
                          : screenWidth < 600
                              ? 30
                              : 40,
                      color: theme.colorScheme.onSurface.withOpacity(0.7),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SocialLinksWidget(
                    theme: theme,
                  )
                ],
              ),
              if (screenWidth >= 700)
                DonutRevealWidget(
                  imagePath: 'avatar.png',
                  size: screenWidth >= 900
                      ? 300
                      : screenWidth >= 800
                          ? 250
                          : 200,
                  animationDuration: const Duration(seconds: 3),
                ),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
