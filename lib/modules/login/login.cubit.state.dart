// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';

class LoginCubitState extends Equatable {
  final Status status;
  final int role;

  const LoginCubitState({
    this.status = Status.initial,
    this.role = 0,
  });

  LoginCubitState copyWith({
    Status? status,
    int? role,
  }) {
    return LoginCubitState(
      status: status ?? this.status,
      role: role ?? this.role,
    );
  }

  @override
  List<Object> get props => [status, role];
}

enum Status { initial, loading, error, success }
