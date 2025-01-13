
import 'package:flutter/material.dart';

class SkillCard extends StatelessWidget {
  final Map<String, dynamic> skill;

  const SkillCard({super.key, required this.skill});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180, // Fixed width
      height: 200, // Fixed height for uniform size
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: skill['color'],
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12, // Subtle shadow for a clean look
            offset: Offset(2, 2),
            blurRadius: 6,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(skill['icon'], size: 40, color: Colors.white),
          Text(
            skill['title'],
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          LinearProgressIndicator(
            value: skill['rating'] / 100,
            color: Colors.white,
            backgroundColor: Colors.white24,
          ),
        ],
      ),
    );
  }
}
