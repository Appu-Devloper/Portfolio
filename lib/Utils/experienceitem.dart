import 'package:flutter/material.dart';

class ExperienceItem extends StatelessWidget {
  final Map<String, dynamic> experience;
  final ThemeData theme;
  final double screenWidth;

  const ExperienceItem({
    Key? key,
    required this.experience,
    required this.theme,
    required this.screenWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        screenWidth > 600
            ? _buildHorizontalLayout()
            : _buildVerticalLayout(),
      ],
    );
  }

  Widget _buildHorizontalLayout() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Container(
            width: 250,
            child: Text(
              experience['title'],
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.primary,
              ),
            ),
          ),
          Flexible(
            child: _buildSkillBox(),
          ),
        ],
      ),
    );
  }

  Widget _buildVerticalLayout() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            experience['title'],
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.primary,
            ),
            textAlign: TextAlign.left,
          ),
          _buildSkillBox(),
        ],
      ),
    );
  }

  Widget _buildSkillBox() {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(
            color: theme.colorScheme.secondary,
            width: 4,
          ),
        ),
        color: theme.colorScheme.surfaceVariant,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: (experience['keySkills'] as List<String>)
            .map(
              (skill) => Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('• ', style: TextStyle(fontSize: 16)),
                  Expanded(
                    child: Text(
                      skill,
                      style: TextStyle(
                        fontSize: 16,
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
            )
            .toList(),
      ),
    );
  }
}
