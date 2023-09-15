import 'package:auth_mobile_app/models/user_model.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  bool isChecked = false;

  void saveCrud(String username, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (isChecked) {
      prefs.setString("username", username);
      prefs.setString("password", password);
    } else {
      prefs.clear();
    }
  }

  Future<dynamic> login(String username, String password) async {
    emit(AuthLoading());
    try {
      Response response = await Dio().post('https://dummyjson.com/auth/login',
          data: {'username': username, 'password': password},
          options: Options(headers: {'Content-Type': 'application/json'}));
      Map<String, dynamic> userInfo = response.data;
      UserModel user = UserModel.fromJson(userInfo);
      saveCrud(username, password);
      emit(AuthSuccess());
      return user;
    } catch (e) {
      debugPrint(e.toString());
      emit(AuthFailure(errMsg: 'Invalid username or password'));
    }
  }
}
