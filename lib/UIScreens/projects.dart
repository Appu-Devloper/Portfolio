
import 'package:flutter/material.dart';
import 'package:project_3d/Constants/data.dart';

import '../Utils/Certificate.dart';
import '../Utils/projectscard.dart';
import 'Skills.dart';
import 'experiencelist.dart';

class ProjectsListView extends StatelessWidget {
  final List<Map<String, dynamic>> projects;
  final ThemeData theme;

  const ProjectsListView({
    super.key,
    required this.projects,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Center(
      child: Column(
        children: [
           
                   Text(
                    'Work & Experience',
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
          ExperienceList(experiences: experiences, theme: theme, screenWidth: MediaQuery.sizeOf(context).width,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 20),
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(), // Prevent independent scrolling
              shrinkWrap: true, // Let the list take up only as much space as needed
              itemCount: projects.length,
              itemBuilder: (context, index) {
                final project = projects[index];
                final isLeftAligned = index % 2 == 0;
            
                return Column(
                  children: [
                    ExpandableCard(
                    
                      subtitle: project['subtitle']!,
                      icon: project['icon']!,
                      title: project['title']!,
                      description: project['description']!,
                      isLeftAligned: isLeftAligned,
                      theme: theme, // Pass the theme for consistent styling
                    ),
                    if (index != projects.length - 1)
                      Container(
                        height: 40,
                        width: 2,
                        color: theme.colorScheme.onSurface.withOpacity(0.5),
                      ),
                  ],
                );
              },
            ),
          ),
           Text(
                    'Tech Stack',
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
         SkillsScreen(),
         Certificates() 
        ],
      ),
    );
  }
}
