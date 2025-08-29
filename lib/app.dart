import 'package:aurora_website/presentation/home/home_screen.dart';
import 'package:flutter/material.dart';

class AuroraSoft extends StatelessWidget {
  const AuroraSoft({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AuroraSoft',
      theme: ThemeData(
        primaryColor: const Color(0xFF39B54A),
        secondaryHeaderColor: const Color(0xFF414042),
      ),
      home: const HomeScreen(),
    );
  }
}
