// ignore_for_file: library_private_types_in_public_api

import 'dart:async';
import 'package:flutter/material.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  final List<String> quotes = [
    "Code is like humor. When you have to explain it, it’s bad.",
    "Make it work, make it right, make it fast.",
    "First, solve the problem. Then, write the code.",
    "Programs must be written for people to read, and only incidentally for machines to execute.",
    "Simplicity is the soul of efficiency.",
  ];
  int currentQuoteIndex = 0;

  @override
  void initState() {
    super.initState();

    // Rotate through quotes every 3 seconds
    Timer.periodic(const Duration(seconds: 3), (timer) {
      if(mounted)
      setState(() {
        currentQuoteIndex = (currentQuoteIndex + 1) % quotes.length;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
         color: Colors.white
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Animated GIF
              Container(
                width: 200,
                height: 200,
                child: Image.asset(
                  'assets/creative.gif', // Replace with your actual GIF path
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 20),

              // Rotating Quotes
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                child: Text(
                  quotes[currentQuoteIndex],
                  key: ValueKey<int>(currentQuoteIndex),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Circular Progress Indicator
              CircularProgressIndicator(
                valueColor:
                    AlwaysStoppedAnimation<Color>(Colors.white.withOpacity(0.8)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
