import 'package:auth_mobile_app/cubits/cubit/auth_cubit.dart';
import 'package:auth_mobile_app/extensions.dart';
import 'package:auth_mobile_app/models/user_model.dart';
import 'package:auth_mobile_app/views/profile_view.dart';
import 'package:auth_mobile_app/views/register_view.dart';
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
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode? autovalidateMode = AutovalidateMode.disabled;
  bool obsecured = true;
  bool isLoading = false;
  UserModel? user;
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
                  text: 'Forgot password?',
                ),
                BlocConsumer<AuthCubit, AuthState>(
                  listener: (context, state) {
                    if (state is AuthLoading) {
                      isLoading = true;
                    }
                    if (state is AuthSuccess) {
                      context.navigateTo(ProfileView(
                        username: user!.username,
                        email: user!.email,
                        gender: user!.gender,
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
                            user = await BlocProvider.of<AuthCubit>(context)
                                .login(username.text, password.text);
                          } else {
                            autovalidateMode = AutovalidateMode.always;
                            setState(() {});
                          }
                        },
                        text: 'Log in');
                  },
                ),
                HaveAccountRow(
                    text: 'Don\'t have an account?',
                    button: 'Register',
                    onTap: () => context.navigateTo(const RegisterView()))
              ],
            ),
          ),
        )
      ],
    ));
  }
}
