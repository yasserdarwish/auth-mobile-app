import 'package:auth_mobile_app/cubits/cubit/auth_cubit.dart';
import 'package:auth_mobile_app/views/widgets/custom_button.dart';
import 'package:auth_mobile_app/views/widgets/custom_field.dart';
import 'package:auth_mobile_app/views/widgets/custom_stack.dart';
import 'package:auth_mobile_app/views/widgets/custom_title.dart';
import 'package:auth_mobile_app/views/widgets/have_account_row.dart';
import 'package:auth_mobile_app/views/widgets/remember_me_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  bool obsecured = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      padding: EdgeInsets.zero,
      children: [
        const CustomStack(),
        const SizedBox(height: 80),
        const CustomTitle(text: 'Log in to your account'),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              CustomField(
                hint: 'Username',
                icon: 'assets/icons/X Icon.svg',
                controller: username,
                onPressed: () {
                  username.clear();
                  setState(() {});
                },
              ),
              CustomField(
                obsecured: obsecured,
                hint: 'Password',
                icon: 'assets/icons/Hide.svg',
                onPressed: () {
                  obsecured = !obsecured;
                  setState(() {});
                },
                controller: password,
              ),
              RememberMeRow(
                text: 'Forgot password?',
                username: username.toString(),
                password: password.toString(),
              ),
              CustomButton(
                  onPressed: () async {
                    BlocProvider.of<AuthCubit>(context)
                        .saveCrud(username, password);
                  },
                  text: 'Log in'),
              const HaveAccountRow(
                  text: 'Don\'t have an account?', button: 'Register')
            ],
          ),
        )
      ],
    ));
  }
}
