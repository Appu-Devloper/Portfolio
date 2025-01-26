import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'Constants/colors.dart';
import 'UIScreens/fallback.dart';
import 'UIScreens/navigationbar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';



Future<void> main() async {
  
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseFirestore.instance.settings = const Settings(
    persistenceEnabled: true,
  );


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
      if(mounted)
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
                  if(mounted)
                  setState(() {
                    isDarkTheme = !isDarkTheme;
                  });
                },
              ));
  }
}
