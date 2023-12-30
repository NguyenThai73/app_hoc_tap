import 'package:fe/constant/date-pick-time.dart';
import 'package:fe/model/user.model.dart';
import 'package:fe/provider/nguoi.dung.provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'register.cubit.state.dart';

class RegisterCubit extends Cubit<RegisterCubitState> {
  final TextEditingController email = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController address = TextEditingController();
  final TextEditingController sdt = TextEditingController();
  final TextEditingController lopHoc = TextEditingController();
  final TextEditingController heHoc = TextEditingController();
  final TextEditingController nganhHoc = TextEditingController();
  String? ngaySinh;

  RegisterCubit() : super(const RegisterCubitState());

  UserModel converUser() {
    return UserModel(
      role: 2,
      userName: email.text,
      fullName: name.text,
      avatar: state.avatar ?? "",
      ngaySinh: convertTimeStamp(ngaySinh!, "00:00:00"),
      gioiTinh: state.gioiTinh,
      email: email.text,
      address: address.text,
      sdt: sdt.text,
      lopHoc: lopHoc.text,
      heHoc: heHoc.text,
      nganhHoc: nganhHoc.text,
      status: 1,
    );
  }

  void register() async {
    emit(state.copyWith(status: Status.loading));
    UserModel userModel = UserModel(
      role: 2,
      userName: email.text,
      fullName: name.text,
      avatar: state.avatar ?? "",
      ngaySinh: convertTimeStamp(ngaySinh!, "00:00:00"),
      gioiTinh: state.gioiTinh,
      email: email.text,
      address: address.text,
      sdt: sdt.text,
      lopHoc: lopHoc.text,
      heHoc: heHoc.text,
      nganhHoc: nganhHoc.text,
      status: 1,
    );
    var checkRegister = await NguoiDungProvider.themMoi(userModel);
    if (checkRegister != null) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setInt("role", 2);
      prefs.setInt("id", checkRegister);
      prefs.setString("avatar", state.avatar ?? "");
      prefs.setString("name", userModel.fullName ?? "");
      emit(state.copyWith(status: Status.success));
    } else {
      emit(state.copyWith(status: Status.error));
    }
  }

  void changeGioiTinh(bool gioiTinh) {
    emit(state.copyWith(gioiTinh: gioiTinh));
  }

  void changeavatar(String fileName) {
    emit(state.copyWith(avatar: fileName));
  }
}
