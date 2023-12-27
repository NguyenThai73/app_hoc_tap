// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';

class RegisterCubitState extends Equatable {
  final Status status;
  final String? avatar;
  final bool gioiTinh;

  const RegisterCubitState({
    this.status = Status.initial,
    this.avatar,
    this.gioiTinh = false,

  });

  RegisterCubitState copyWith({
    Status? status,
       String? avatar,
   bool? gioiTinh,
  }) {
    return RegisterCubitState(
      status: status ?? this.status,
      avatar: avatar ?? this.avatar,
      gioiTinh: gioiTinh ?? this.gioiTinh,

    );
  }

  @override
  List<Object?> get props => [status, gioiTinh, avatar];
}

enum Status { initial, loading, error, success }
