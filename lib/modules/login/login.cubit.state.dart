// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';

class LoginCubitState extends Equatable {
  final Status status;

  const LoginCubitState({
    this.status = Status.initial,
  });

  LoginCubitState copyWith({
    Status? status,
  }) {
    return LoginCubitState(
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [status];
}

enum Status { initial, loading, error, success }
