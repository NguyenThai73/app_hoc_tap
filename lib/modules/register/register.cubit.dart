import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import 'register.cubit.state.dart';

class RegisterCubit extends Cubit<RegisterCubitState> {
  final TextEditingController email = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();

  RegisterCubit() : super(const RegisterCubitState());

  void login() async {
    emit(state.copyWith(status: Status.loading));
    print("email: ${email.text}");
    print("password: ${password.text}");
    await Future.delayed(const Duration(seconds: 2));
    emit(state.copyWith(status: Status.success));
  }
}
