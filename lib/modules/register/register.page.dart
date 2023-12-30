// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously

import 'package:email_otp/email_otp.dart';
import 'package:fe/constant/loading.dart';
import 'package:fe/constant/no.focus.scope.dart';
import 'package:fe/constant/radio.select.dart';
import 'package:fe/constant/text.field.component.dart';
import 'package:fe/constant/date-pick-time.dart';
import 'package:fe/constant/toast.dart';
import 'package:fe/model/user.model.dart';
import 'package:fe/provider/base.url.dart';
import 'package:fe/provider/nguoi.dung.provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'register.cubit.dart';
import 'register.cubit.state.dart';
import 'verify.otp.screen.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  EmailOTP myauth = EmailOTP();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 25,
          ),
        ),
        title: const Center(
          child: Text(
            "Đăng ký",
            style: TextStyle(
                color: Colors.white, fontSize: 22, fontWeight: FontWeight.w500),
          ),
        ),
        actions: const [SizedBox(width: 44)],
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: <Color>[Color(0xFF5adce4), Color(0xFF014dae)]),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            NoFocusScope(
              child: BlocConsumer<RegisterCubit, RegisterCubitState>(
                listener: (context, state) {
                  if (state.status == Status.loading) {
                    onLoading(context);
                  }
                  if (state.status == Status.success) {
                    Navigator.pop(context);
                  }
                  if (state.status == Status.error) {
                    Navigator.pop(context);
                    showToast(
                      context: context,
                      msg: "Đăng ký không thành công",
                      color: const Color.fromARGB(255, 255, 179, 86),
                      icon: const Icon(Icons.info),
                    );
                  }
                },
                builder: (context, state) {
                  return SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(height: 30),
                          SizedBox(
                            width: 130,
                            height: 130,
                            child: ClipOval(
                              child:
                                  (state.avatar != null && state.avatar != "")
                                      ? Image.network(
                                          "$baseUrl/api/files/${state.avatar ?? ""}",
                                          fit: BoxFit.cover,
                                        )
                                      : Image.asset("assets/no_avatar.jpeg"),
                            ),
                          ),
                          IconButton(
                              onPressed: () async {
                                var imagePath = await handleUploadAvater();
                                if (imagePath != null && imagePath != "") {
                                  context
                                      .read<RegisterCubit>()
                                      .changeavatar(imagePath);
                                }
                              },
                              icon: Icon(
                                Icons.photo_camera,
                                color: const Color(0xFF0723B8),
                                size: 30,
                              )),
                          SizedBox(height: 10),
                          TextFielComponent(
                            controller: context.read<RegisterCubit>().email,
                            iconData: Icons.email,
                            hintText: "Email",
                          ),
                          const SizedBox(height: 20),
                          TextFielComponent(
                            controller: context.read<RegisterCubit>().name,
                            iconData: Icons.person,
                            hintText: "Họ tên",
                          ),
                          const SizedBox(height: 20),
                          // TextFielComponent(
                          //   controller: context.read<RegisterCubit>().password,
                          //   iconData: Icons.lock,
                          //   hintText: "Mật khẩu",
                          //   isPassword: true,
                          // ),
                          // const SizedBox(height: 20),
                          // TextFielComponent(
                          //   controller:
                          //       context.read<RegisterCubit>().confirmPassword,
                          //   iconData: Icons.lock,
                          //   hintText: "Nhập lại mật khẩu",
                          //   isPassword: true,
                          // ),
                          // const SizedBox(height: 20),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: DatePickerBox1(
                                isTime: false,
                                label: 'Ngày sinh',
                                dateDisplay:
                                    context.read<RegisterCubit>().ngaySinh,
                                selectedDateFunction: (day) {
                                  context.read<RegisterCubit>().ngaySinh = day;
                                }),
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  "Giới tính",
                                  style: TextStyle(
                                      color: Color(0xFF0723B8),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                                RadioSelect(
                                  title: 'Nam',
                                  onTap: () {
                                    context
                                        .read<RegisterCubit>()
                                        .changeGioiTinh(false);
                                  },
                                  isSelected: state.gioiTinh == false,
                                ),
                                RadioSelect(
                                  title: 'Nữ',
                                  onTap: () {
                                    context
                                        .read<RegisterCubit>()
                                        .changeGioiTinh(true);
                                  },
                                  isSelected: state.gioiTinh == true,
                                )
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          TextFielComponent(
                            controller: context.read<RegisterCubit>().sdt,
                            iconData: Icons.phone,
                            hintText: "Số điện thoại",
                          ),
                          const SizedBox(height: 20),
                          TextFielComponent(
                            controller: context.read<RegisterCubit>().address,
                            iconData: Icons.location_on,
                            hintText: "Địa chỉ",
                          ),
                          const SizedBox(height: 20),
                          TextFielComponent(
                            controller: context.read<RegisterCubit>().lopHoc,
                            iconData: Icons.school,
                            hintText: "Lớp học",
                          ),
                          const SizedBox(height: 20),
                          TextFielComponent(
                            controller: context.read<RegisterCubit>().nganhHoc,
                            iconData: Icons.history_edu,
                            hintText: "Ngành học",
                          ),
                          const SizedBox(height: 20),
                          TextFielComponent(
                            controller: context.read<RegisterCubit>().heHoc,
                            iconData: Icons.square_foot,
                            hintText: "Hệ học",
                          ),
                          InkWell(
                            onTap: () async {
                              if (context
                                      .read<RegisterCubit>()
                                      .email
                                      .text
                                      .isEmpty ||
                                  context
                                      .read<RegisterCubit>()
                                      .name
                                      .text
                                      .isEmpty ||
                                  context
                                      .read<RegisterCubit>()
                                      .sdt
                                      .text
                                      .isEmpty ||
                                  context
                                      .read<RegisterCubit>()
                                      .address
                                      .text
                                      .isEmpty ||
                                  context
                                      .read<RegisterCubit>()
                                      .lopHoc
                                      .text
                                      .isEmpty ||
                                  context
                                      .read<RegisterCubit>()
                                      .heHoc
                                      .text
                                      .isEmpty ||
                                  context
                                      .read<RegisterCubit>()
                                      .nganhHoc
                                      .text
                                      .isEmpty ||
                                  context.read<RegisterCubit>().ngaySinh ==
                                      null) {
                                showToast(
                                  context: context,
                                  msg: "Nhập đủ thông tin",
                                  color:
                                      const Color.fromARGB(255, 255, 179, 86),
                                  icon: const Icon(Icons.info),
                                );
                              } else {
                                onLoading(context);
                                UserModel userModel =
                                    context.read<RegisterCubit>().converUser();

                                var checkUser =
                                    await NguoiDungProvider.getUserByEmail(
                                        context
                                            .read<RegisterCubit>()
                                            .email
                                            .text);
                                if (checkUser == null) {
                                  myauth.setConfig(
                                      appEmail: "me@rohitchouhan.com",
                                      appName: "StulnforPro Email OTP",
                                      userEmail: context
                                          .read<RegisterCubit>()
                                          .email
                                          .text,
                                      otpLength: 6,
                                      otpType: OTPType.digitsOnly);
                                  if (await myauth.sendOTP() == true) {
                                    Navigator.pop(context);
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                      content: Text("OTP has been sent"),
                                    ));
                                    Navigator.push<void>(
                                      context,
                                      MaterialPageRoute<void>(
                                        builder: (BuildContext context) =>
                                            VerifyOtpScreen(
                                          userModel: userModel,
                                          myauth: myauth,
                                        ),
                                      ),
                                    );
                                  } else {
                                    Navigator.pop(context);
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                      content: Text("Oops, OTP send failed"),
                                    ));
                                  }
                                } else {
                                  Navigator.pop(context);
                                  showToast(
                                    context: context,
                                    msg: "Email đã tồn tại",
                                    color:
                                        const Color.fromARGB(255, 255, 179, 86),
                                    icon: const Icon(Icons.info),
                                  );
                                }
                              }
                            },
                            child: Container(
                              margin:
                                  const EdgeInsets.only(top: 30, bottom: 10),
                              height: 40,
                              width: 250,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: const Color(0xFF5266D4),
                              ),
                              child: const Center(
                                child: Text(
                                  "Đăng ký",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
