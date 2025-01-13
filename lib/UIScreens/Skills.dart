import 'package:flutter/material.dart';

import '../Constants/data.dart';
import '../Utils/skillcard.dart';

class SkillsScreen extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Wrap(
          spacing: 16,
          runSpacing: 16,
          children: skills.map((skill) {
            return SkillCard(skill: skill);
          }).toList(),
        )
    );
  }
}
