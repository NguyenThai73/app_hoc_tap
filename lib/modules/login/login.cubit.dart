import 'package:fe/modules/login/login.cubit.state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class LoginCubit extends Cubit<LoginCubitState> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  LoginCubit() : super(const LoginCubitState());

  void login() async {
    emit(state.copyWith(status: Status.loading));
    await Future.delayed(const Duration(microseconds: 300));
    if (email.text == "test@gmail.com") {
      emit(state.copyWith(status: Status.success));
    } else {
      emit(state.copyWith(status: Status.error));
    }
  }
}
