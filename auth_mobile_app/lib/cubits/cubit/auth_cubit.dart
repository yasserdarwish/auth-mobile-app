import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  bool isChecked = false;

  saveCrud(
      TextEditingController username, TextEditingController password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (isChecked) {
      prefs.setString("username", username.text);
      prefs.setString("password", password.text);
    } else {
      prefs.clear();
    }
    print(prefs.getString("username"));
    print(prefs.getString("password"));
  }
}
