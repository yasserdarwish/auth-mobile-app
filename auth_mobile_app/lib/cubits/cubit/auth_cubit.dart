import 'package:auth_mobile_app/main.dart';
import 'package:auth_mobile_app/models/user_model.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  bool isChecked = false;

  void saveCrud(int id, String username, String email, String gender) async {
    if (isChecked) {
      prefs.setInt("id", id);
      prefs.setString("username", username);
      prefs.setString("email", email);
      prefs.setString("gender", gender);
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
      saveCrud(user.id, user.username, user.email, user.gender);
      emit(AuthSuccess());
      return user;
    } catch (e) {
      debugPrint(e.toString());
      emit(AuthFailure(errMsg: 'Invalid username or password'));
    }
  }
}
