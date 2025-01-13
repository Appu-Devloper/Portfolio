import 'package:flutter/material.dart';

import '../Utils/experienceitem.dart';

class ExperienceList extends StatelessWidget {
  final List<Map<String, dynamic>> experiences;
  final ThemeData theme;
  final double screenWidth;

  const ExperienceList({
    super.key,
    required this.experiences,
    required this.theme,
    required this.screenWidth,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width / 1.2,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: experiences.length,
          itemBuilder: (context, index) {
            return ExperienceItem(
              experience: experiences[index],
              theme: theme,
              screenWidth: screenWidth,
            );
          },
        ),
      ),
    );
  }
}
