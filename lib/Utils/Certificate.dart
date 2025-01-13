import 'dart:ui';
import 'package:flutter/material.dart';

import '../Constants/data.dart';


class Certificates extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return  Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Wrap(
            spacing: 10.0,
            runSpacing: 10.0,
            children: certificates.map((certificate) {
              return CertificateCard(
                title: certificate['title']!,
                image: certificate['image']!,
                description: certificate['description']!,
              );
            }).toList(),
          ),
        ),
      );
  }}

class CertificateCard extends StatefulWidget {
  final String title;
  final String image;
  final String description;

  CertificateCard({
    required this.title,
    required this.image,
    required this.description,
  });

  @override
  _CertificateCardState createState() => _CertificateCardState();
}

class _CertificateCardState extends State<CertificateCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    // Retrieve theme colors
    final primaryColor = Theme.of(context).primaryColor;
    final accentColor = Theme.of(context).shadowColor;
    final hoverOverlayColor = primaryColor.withOpacity(0.6);

    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: Stack(
        children: [
          Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Stack(
                children: [
                  Image.asset(
                    widget.image,
                    height: 200,
                    width: 300,
                    fit: BoxFit.cover,
                  ),
                  if (isHovered)
                    BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                      child: Container(
                        height: 200,
                        width: 300,
                        color: hoverOverlayColor,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              widget.description,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            left: 10,
            child: Text(
              widget.title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: accentColor,
                shadows: [
                  Shadow(
                    offset: Offset(1, 1),
                    blurRadius: 3,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
