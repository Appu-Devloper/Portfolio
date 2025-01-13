import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Utils/custombuttton.dart';
import '../Constants/textstyle.dart';

class ContactPage extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final curveHeight = screenHeight * 0.4;
    final theme = Theme.of(context);

    return Column(
      children: [
        Stack(
          children: [
            // Background container with a curve
            Positioned.fill(
              child: CustomPaint(
                painter: CurvedBackgroundPainter(theme: theme),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: curveHeight * 0.2, // Adjusting vertical alignment
                  ),
                  // Header inside the curve
                  Text(
                    "Contact Me",
                    style: customTextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w600,
                      color: theme.colorScheme.onPrimary,
                    ),
                  ),

                  // Sub-header below the curve
                  Text(
                    "Let's Work Together",
                    style: customTextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: theme.colorScheme.onPrimary.withOpacity(0.8),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Contact Details
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.phone,
                          color: theme.colorScheme.secondary, size: 20),
                      const SizedBox(width: 10),
                      Text(
                        "8861357375",
                        style: customTextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: theme.colorScheme.onPrimary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.email,
                          color: theme.colorScheme.secondary, size: 20),
                      const SizedBox(width: 10),
                      GestureDetector(
                        onTap: () async {
                          final Uri emailUri = Uri(
                            scheme: 'mailto',
                            path: 'appua0126@gmail.com',
                            query: 'subject=Contact&body=Hi there,',
                          );
                          if (await canLaunchUrl(emailUri)) {
                            await launchUrl(emailUri);
                          } else {
                            if (kDebugMode) {
                              print("Could not launch email client");
                            }
                          }
                        },
                        child: Text(
                          "appua0126@gmail.com",
                          style: customTextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: theme.colorScheme.onPrimary,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildSocialIcon(
                        FontAwesomeIcons.github,
                        "https://github.com/Appu-Devloper",
                        theme,
                      ),
                      const SizedBox(width: 20),
                      _buildSocialIcon(
                        FontAwesomeIcons.linkedin,
                        "https://www.linkedin.com/in/appu-m-19894a258/",
                        theme,
                      ),
                    ],
                  ),
                  const SizedBox(height: 100),
                  // Form Fields
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        _buildTextField("Name", Icons.person, false, theme),
                        const SizedBox(height: 20),
                        _buildTextField("Email", Icons.email, true, theme),
                        const SizedBox(height: 20),
                        _buildTextField("Message", Icons.message, false, theme,
                            isMessage: true),
                        const SizedBox(height: 30),
                        MyButton(
                          label: "SUBMIT",
                          onPressed: () {},
                          shadowColor:
                              theme.colorScheme.secondary.withOpacity(.5),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Software Developer Quote
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "“First, solve the problem. Then, write the code.”",
                        style: customTextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: theme.colorScheme.onPrimary,
                        ),
                        textAlign: TextAlign.right,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "- John Johnson",
                        style: customTextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: theme.colorScheme.onPrimary.withOpacity(0.8),
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSocialIcon(IconData icon, String url, ThemeData theme) {
    return GestureDetector(
      onTap: () async {
        final Uri uri = Uri.parse(url);
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri, mode: LaunchMode.externalApplication);
        } else {
          if (kDebugMode) {
            print("Could not launch $url");
          }
        }
      },
      child: Icon(
        icon,
        color: theme.colorScheme.onPrimary,
        size: 20,
      ),
    );
  }

  Widget _buildTextField(
      String label, IconData icon, bool isEmail, ThemeData theme,
      {bool isMessage = false}) {
    return SizedBox(
      width: 400,
      child: TextFormField(
        maxLines: isMessage ? 5 : 1,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "$label is required";
          }
          if (isEmail &&
              !RegExp(r"^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$")
                  .hasMatch(value)) {
            return "Enter a valid email";
          }
          return null;
        },
        style: TextStyle(color: theme.colorScheme.onSurface),
        decoration: InputDecoration(
          filled: true,
          fillColor:
              theme.colorScheme.onSecondary, // Background color based on theme
          prefixIcon: Icon(icon, color: theme.colorScheme.secondary),
          hintText: label,
          hintStyle: TextStyle(
            color: theme.colorScheme.onSurface
                .withOpacity(0.6), // Subtle hint color
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}

class CurvedBackgroundPainter extends CustomPainter {
  final ThemeData theme;

  CurvedBackgroundPainter({required this.theme});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = LinearGradient(
        colors: [
          theme.colorScheme.primary,
          theme.colorScheme.secondary,
          theme.colorScheme.background,
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(0, size.height * 0.4);
    path.quadraticBezierTo(
      size.width / 2,
      size.height * 0.3,
      size.width,
      size.height * 0.4,
    );
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
