import 'package:auth_mobile_app/extensions.dart';
import 'package:auth_mobile_app/views/login_view.dart';
import 'package:auth_mobile_app/views/widgets/custom_button.dart';
import 'package:auth_mobile_app/views/widgets/custom_field_no_icon.dart';
import 'package:auth_mobile_app/views/widgets/custom_stack.dart';
import 'package:auth_mobile_app/views/widgets/custom_title.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileView extends StatefulWidget {
  const ProfileView(
      {super.key,
      required this.username,
      required this.email,
      required this.gender});
  final String username;
  final String email;
  final String gender;

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  @override
  void initState() {
    usernameController.text = widget.username;
    emailController.text = widget.email;
    genderController.text = widget.gender;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      padding: EdgeInsets.zero,
      children: [
        const CustomStack(),
        const SizedBox(height: 80),
        const CustomTitle(text: 'Ahmed Saleh'),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              CustomFieldNoIcon(
                hint: 'Username',
                controller: usernameController,
              ),
              CustomFieldNoIcon(
                hint: 'Email',
                controller: emailController,
              ),
              CustomFieldNoIcon(
                hint: 'Gender',
                controller: genderController,
              ),
              CustomButton(
                  color: const Color(0xffDC3545),
                  onPressed: () async {
                    SharedPreferences.getInstance()
                        .then((value) => value.clear());
                    context.navigateTo(const LoginView());
                  },
                  text: 'Log out'),
            ],
          ),
        )
      ],
    ));
  }
}
