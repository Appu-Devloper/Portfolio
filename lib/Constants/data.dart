import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

  final List<Map<String, dynamic>> experiences = [
    {
      'title': 'Software Development Engineer',
      'keySkills': [
        'Designed scalable IoT solutions integrating hardware and software for seamless device communication.',
        'Developed end-to-end full-stack applications enhancing user engagement with features like task prioritization and subscription models.',
       
      ],
    },
    {
      'title': 'Application Engineer',
      'keySkills': [
        'Proficient in Flutter and Dart, delivering multimedia apps with 5,000+ downloads and real-time IoT dashboards.',
        'Enhanced backend performance with optimized SQL architectures and scalable database solutions.',
      ],
    },
  ];

final List<Map<String, dynamic>> projects = [
    {
      'title': 'Cross Platform App',
      'subtitle': 'Multimedia Streaming App',
      'description':
          'Developed and maintained the Vishwanandini App for multimedia streaming of audio, video, and PDF content. Integrated real-time chat using SQLite, enhancing user engagement and retention. Achieved 5,000+ downloads with an 80% retention rate across platforms.',
      'image': 'assets/VN.jpg',
      'icon': FontAwesomeIcons.appStore
    },
    {
      'title': 'Excel Comparison and Validation',
      'subtitle': 'Data Validation Tool',
      'description':
          'Developed a Flutter-based application for data comparison and validation. Implemented a feature-rich app to upload and compare Excel files, validating specific fields, including date matching and calibration data validation. Integrated Python API for backend processing, reducing manual validation efforts by 40%.',
      'image': 'assets/excelcmp.jpg',   'icon': FontAwesomeIcons.solidFileExcel
    },
    {
      'title': 'IoT Dashboard',
      'subtitle': 'Real-Time Data Management',
      'description':
          'Developed a comprehensive IoT dashboard for real-time data visualization and report generation, incorporating serial port data acquisition. Enhanced accuracy and reduced reporting time by 30%.',
      'image': 'assets/iot.jpg',   'icon': FontAwesomeIcons.gauge
    },
    
    {
  'title': 'macOS Admin Dashboards',
  'subtitle': 'Effortless Data Management for Streaming Apps',
  'description':
      'Designed and implemented macOS dashboards for administrators to upload and manage data seamlessly. The dashboards ensure efficient data streaming into the connected applications, enabling real-time updates and smooth operations.',
  'image': 'assets/mac.jpg',   'icon': FontAwesomeIcons.appStoreIos
},
{
  'title': 'Quiz Application',
  'subtitle': 'Interactive Quizzing Made Simple',
  'description':
      'Developed a versatile Flutter application for quizzes using data parsing from CSV files. Supports seamless integration for both Windows and web platforms, ensuring a responsive user experience.',
  'image': 'assets/quiz.jpg',   'icon': FontAwesomeIcons.quinscape
},
  ];
 final List<Map<String, dynamic>> skills = [
    {
      'title': 'Flutter and Dart Programming',
      'rating': 80,
      'description': 'Developed cross-platform applications with Flutter, ensuring seamless performance across iOS and Android. Designed custom widgets and animations for intuitive UIs, achieving 5,000+ app downloads. Implemented BLoC architecture for scalable state management, enabling smooth API integration and real-time content updates.',
      'icon': FontAwesomeIcons.flutter,
      'color': Color(0xFF6C63FF), // Professional purple
    },
    {
      'title': 'SQL  and Database Management',
      'rating': 70,
      'description': 'Engineered scalable database architectures for high-load applications, ensuring concurrency and data integrity. Optimized SQL queries, reducing response times by 40%, and implemented stored procedures for efficient backend processing.',
      'icon': FontAwesomeIcons.database,
      'color': Color(0xFF56CCF2), // Soft blue
    },
    {
      'title': 'Python & API Design',
      'rating': 65,
      'description': 'Utilized Python frameworks like Flask and Django to develop robust backend APIs. Automated data validation and processing pipelines using Pandas and openpyxl, reducing manual efforts by 40%.',
      'icon': FontAwesomeIcons.python,
      'color': Color(0xFF27AE60), // Green
    },
    {
      'title': 'Cross-Platform Development',
      'rating': 80,
      'description': 'Delivered responsive and performant apps using Flutter’s rich widget library and platform-specific integrations. Debugged and resolved platform-specific issues, ensuring consistent UX across all devices.',
      'icon': FontAwesomeIcons.laptopCode,
      'color': Color(0xFFE67E22), // Orange
    },
    {
      'title': 'Flutter Bloc and Clean Architecture',
      'rating': 70,
      'description': 'Applied BLoC pattern for scalable and reactive state management in complex applications. Streamlined user flows by decoupling UI and business logic.',
      'icon': Icons.sync_alt,
      'color': Color(0xFFF1C40F), // Yellow
    },
    {
      'title': 'Firebase Messaging',
      'rating': 70,
      'description': 'Integrated Firebase Cloud Messaging (FCM) for real-time push notifications and user-specific messaging. Designed notification triggers for task reminders and updates.',
      'icon': FontAwesomeIcons.fire,
      'color': Color(0xFFD35400), // Burnt orange
    },
    {
      'title': 'Responsiveness & Scalability',
      'rating': 90,
      'description': 'Engineered responsive UIs for seamless adaptation across various screen sizes and resolutions. Designed scalable backend architectures to support increasing user demands.',
      'icon': Icons.expand,
      'color': Color(0xFF34495E), // Dark blue-grey
    },
  ];
  final List<Map<String, String>> certificates = [
    {
      'title': 'Python Basics',
      'image': 'assets/python_certificate.png',
      'description': 'Certified in Python basics, covering programming fundamentals.',
    },
    {
      'title': 'SQL Intermediate',
      'image': 'assets/sql_certificate.png',
      'description': 'Certified in SQL, focusing on database queries and management.',
    },
    {
      'title': 'Software Engineering',
      'image': 'assets/software_engineering_certificate.png',
      'description': 'Certified Software Engineer with practical project experience.',
    },
  ];
