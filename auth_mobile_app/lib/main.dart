import 'package:flutter/material.dart';

void main() {
  runApp(const AuthMobileApp());
}

class AuthMobileApp extends StatelessWidget {
  const AuthMobileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Scaffold(),
      theme: ThemeData(fontFamily: 'Inter'),
    );
  }
}
