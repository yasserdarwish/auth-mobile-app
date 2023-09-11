import 'package:auth_mobile_app/views/widgets/custom_field.dart';
import 'package:auth_mobile_app/views/widgets/custom_stack.dart';
import 'package:auth_mobile_app/views/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        const CustomStack(),
        const SizedBox(height: 80),
        const CustomTitle(text: 'Log in to your account'),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: ListView(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            children: const [
              CustomField(hint: 'Username', icon: 'assets/icons/X Icon.svg'),
              CustomField(hint: 'Password', icon: 'assets/icons/Hide.svg'),
            ],
          ),
        )
      ],
    ));
  }
}
