import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  bool isChecked = false;

  saveCrud(String username, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (isChecked) {
      prefs.setString("username", username);
      prefs.setString("password", password);
    } else {
      prefs.clear();
    }
  }

  login(String username, String password) async {
    emit(AuthLoading());
    try {
      Response response = await Dio().post('https://dummyjson.com/auth/login',
          data: {'username': username, 'password': password},
          options: Options(headers: {'Content-Type': 'application/json'}));

      saveCrud(username, password);

      emit(AuthSuccess());
    } catch (e) {
      debugPrint(e.toString());
      emit(AuthFailure(errMsg: 'Invalid username or password'));
    }
  }
}
