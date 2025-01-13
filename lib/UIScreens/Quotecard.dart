import 'dart:math';

import 'package:flutter/material.dart';
import 'package:project_3d/Constants/textstyle.dart';

import '../Constants/colors.dart';

class ProjectCardWidget extends StatelessWidget {
  const ProjectCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const ProjectCard3D();
  }
}

class ProjectCard3D extends StatefulWidget {
  const ProjectCard3D({super.key});

  @override
  _ProjectCard3DState createState() => _ProjectCard3DState();
}

class _ProjectCard3DState extends State<ProjectCard3D> {
  double rotationX = 0.0;
  double rotationY = 0.0;

  @override
  Widget build(BuildContext context) {
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()
        ..rotateX(pi / 5)
        ..rotateY(pi / 5)
        ..setEntry(3, 2, 4), // Adds perspective effect
      child: Card(
        elevation: 10,
        shadowColor: Colors.black.withOpacity(0.4),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Container(
          width: 220,
          height: 320,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(
              colors: [primaryColor, Colors.lightBlueAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            children: [
              // Mac-style dots
              Padding(
                padding:
                    const EdgeInsets.only(top: 8.0, left: 12.0, right: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // Red dot
                    _buildDot(Colors.red),
                    SizedBox(width: 8),
                    // Yellow dot
                    _buildDot(Colors.yellow),
                    SizedBox(width: 8),
                    // Green dot
                    _buildDot(Colors.green),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.code,
                        color: Colors.white,
                        size: 48,
                      ),
                      SizedBox(height: 16),
                      Text(
                          '“Code is like humor. When you have to explain it, it’s bad.”',
                          textAlign: TextAlign.center,
                          style: customTextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600)),
                      SizedBox(height: 20),
                      Text('- Cory House',
                          textAlign: TextAlign.center,
                          style: customTextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDot(Color color) {
    return Container(
      width: 12,
      height: 12,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: Border.all(color: Color(0xFFA5ADB0), width: 1),
      ),
    );
  }
}
