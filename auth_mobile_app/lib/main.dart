import 'package:auth_mobile_app/views/login_view.dart';
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
      home: const LoginView(),
      theme: ThemeData(fontFamily: 'Inter'),
    );
  }
}
