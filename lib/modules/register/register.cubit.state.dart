// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';

class RegisterCubitState extends Equatable {
  final Status status;

  const RegisterCubitState({
    this.status = Status.initial,
  });

  RegisterCubitState copyWith({
    Status? status,
  }) {
    return RegisterCubitState(
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [status];
}

enum Status { initial, loading, error, success }
