import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'Constants/colors.dart';
import 'UIScreens/fallback.dart';
import 'UIScreens/navigationbar.dart';

void main()async { 
   await dotenv.load(fileName: ".env");
  runApp(

  const MyPortfolio());
}

class MyPortfolio extends StatefulWidget {
  const MyPortfolio({super.key});

  @override
  _MyPortfolioState createState() => _MyPortfolioState();
}

class _MyPortfolioState extends State<MyPortfolio> {
  bool showGif = true; // Control the visibility of the GIF

  @override
  void initState() {
    super.initState();

    // Hide the GIF after 5 seconds
    Timer(const Duration(seconds: 5), () {
      setState(() {
        showGif = false;
      });
    });
  }

  bool isDarkTheme = true;
  final _darkTheme = darkTheme;
  final _lightTheme = lightTheme;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Appu Portfolio",
        debugShowCheckedModeBanner: false,
        theme: isDarkTheme ? _darkTheme : _lightTheme,
        home: showGif
            ? LoadingPage()
            : ResponsiveHomePage(
                onToggleTheme: () {
                  setState(() {
                    isDarkTheme = !isDarkTheme;
                  });
                },
              ));
  }
}
