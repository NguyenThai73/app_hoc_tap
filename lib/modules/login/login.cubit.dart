import 'package:fe/modules/login/login.cubit.state.dart';
import 'package:fe/provider/nguoi.dung.provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginCubit extends Cubit<LoginCubitState> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  LoginCubit() : super(const LoginCubitState());

  void login() async {
    emit(state.copyWith(status: Status.loading));
    await Future.delayed(const Duration(microseconds: 300));
    var userLogin = await NguoiDungProvider.login(
        email: email.text, password: password.text);
    if (userLogin != null) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setInt("role", userLogin.role ?? 0);
      prefs.setInt("id", userLogin.id ?? 0);
      prefs.setString("avatar", userLogin.avatar ?? "");
      prefs.setString("name", userLogin.fullName ?? "");
      emit(state.copyWith(status: Status.success, role: userLogin.role ?? 0));
    } else {
      emit(state.copyWith(status: Status.error));
    }
  }
}
