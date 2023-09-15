import 'package:auth_mobile_app/cubits/cubit/auth_cubit.dart';
import 'package:auth_mobile_app/views/login_view.dart';
import 'package:auth_mobile_app/views/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences prefs;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  runApp(const AuthMobileApp());
}

class AuthMobileApp extends StatelessWidget {
  const AuthMobileApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: prefs.getInt('id') == null
            ? LoginView()
            : ProfileView(
                username: prefs.getString('username')!,
                email: prefs.getString('email')!,
                gender: prefs.getString('gender')!),
        theme: ThemeData(fontFamily: 'Inter'),
      ),
    );
  }
}
