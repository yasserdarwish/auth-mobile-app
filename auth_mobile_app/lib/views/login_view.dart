import 'package:auth_mobile_app/views/widgets/custom_stack.dart';
import 'package:auth_mobile_app/views/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Column(
      children: [
        CustomStack(),
        SizedBox(height: 80),
        CustomTitle(text: 'Log in to your account')
      ],
    ));
  }
}
