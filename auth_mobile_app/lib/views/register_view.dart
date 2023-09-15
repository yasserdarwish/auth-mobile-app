import 'package:auth_mobile_app/cubits/cubit/auth_cubit.dart';
import 'package:auth_mobile_app/extensions.dart';
import 'package:auth_mobile_app/views/login_view.dart';
import 'package:auth_mobile_app/views/profile_view.dart';
import 'package:auth_mobile_app/views/widgets/custom_button.dart';
import 'package:auth_mobile_app/views/widgets/custom_field.dart';
import 'package:auth_mobile_app/views/widgets/custom_stack.dart';
import 'package:auth_mobile_app/views/widgets/custom_title.dart';
import 'package:auth_mobile_app/views/widgets/have_account_row.dart';
import 'package:auth_mobile_app/views/widgets/remember_me_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode? autovalidateMode = AutovalidateMode.disabled;
  bool obsecured = true;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      padding: const EdgeInsets.only(bottom: 16),
      children: [
        const CustomStack(),
        const SizedBox(height: 80),
        const CustomTitle(text: 'Create new account'),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Form(
            key: formKey,
            autovalidateMode: autovalidateMode,
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
                  hint: 'Email',
                  icon: 'assets/icons/X Icon.svg',
                  controller: email,
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
                const RememberMeRow(
                  text: 'Have a proplem?',
                ),
                BlocConsumer<AuthCubit, AuthState>(
                  listener: (context, state) {
                    if (state is AuthLoading) {
                      isLoading = true;
                    }
                    if (state is AuthSuccess) {
                      context.navigateTo(ProfileView(
                        username: username,
                      ));
                    }
                    if (state is AuthFailure) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(state.errMsg)));
                      isLoading = false;
                    }
                  },
                  builder: (context, state) {
                    return CustomButton(
                        isLoading: isLoading,
                        color: const Color(0xff007BFF),
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            BlocProvider.of<AuthCubit>(context)
                                .login(username.text, password.text);
                          } else {
                            autovalidateMode = AutovalidateMode.always;
                            setState(() {});
                          }
                        },
                        text: 'Register');
                  },
                ),
                HaveAccountRow(
                    text: 'Already have an account?',
                    button: 'Log in',
                    onTap: () => context.navigateTo(const LoginView()))
              ],
            ),
          ),
        )
      ],
    ));
  }
}
