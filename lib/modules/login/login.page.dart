import 'package:fe/ADMIN/navigator.admin.page.dart';
import 'package:fe/ADOANHNGHIEP/navigator.emloyer.page.dart';
import 'package:fe/constant/loading.dart';
import 'package:fe/constant/no.focus.scope.dart';
import 'package:fe/constant/text.field.component.dart';
import 'package:fe/constant/toast.dart';
import 'package:fe/modules/forgotpass/forgot.pass.page.dart';
import 'package:fe/modules/navigator/navigator.page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../register/register.cubit.dart';
import '../register/register.page.dart';
import 'login.cubit.dart';
import 'login.cubit.state.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            NoFocusScope(
              child: BlocConsumer<LoginCubit, LoginCubitState>(
                listener: (context, state) {
                  if (state.status == Status.loading) {
                    onLoading(context);
                  }
                  if (state.status == Status.success) {
                    Navigator.pop(context);
                    if (state.role == 2) {
                      Navigator.push<void>(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) =>
                              const NavigatorPage(),
                        ),
                      );
                    } else if (state.role == 0) {
                      Navigator.push<void>(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) =>
                              const NavigatorAdminPage(),
                        ),
                      );
                    } else {
                      Navigator.push<void>(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) =>
                              const NavigatorEmployerPage(),
                        ),
                      );
                    }
                  }
                  if (state.status == Status.error) {
                    Navigator.pop(context);
                    showToast(
                      context: context,
                      msg: "Tài khoản mật khẩu không đúng ",
                      color: const Color.fromARGB(255, 255, 179, 86),
                      icon: const Icon(Icons.info),
                    );
                  }
                },
                builder: (context, state) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/background-splash.png"),
                            fit: BoxFit.fill)),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.13,
                              bottom: 20),
                          width: 90,
                          height: 90,
                          child: Image.asset("assets/logo.png",
                              fit: BoxFit.contain),
                        ),
                        const Text(
                          "StulnforPro",
                          style: TextStyle(
                              fontSize: 40,
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                              letterSpacing: 2),
                        ),
                        Container(
                            margin: const EdgeInsets.only(top: 10),
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: Image.asset("assets/image15.png",
                                fit: BoxFit.contain)),
                        const SizedBox(height: 30),
                        TextFielComponent(
                          controller: context.read<LoginCubit>().email,
                          iconData: Icons.person,
                          hintText: "Tên Đăng Nhập",
                        ),
                        const SizedBox(height: 20),
                        TextFielComponent(
                          controller: context.read<LoginCubit>().password,
                          iconData: Icons.lock,
                          hintText: "Mật khẩu",
                          isPassword: true,
                        ),
                        Container(
                            margin: const EdgeInsets.only(top: 10),
                            width: MediaQuery.of(context).size.width * 0.8,
                            alignment: Alignment.centerRight,
                            child: InkWell(
                              onTap: () {
                                Navigator.push<void>(
                                  context,
                                  MaterialPageRoute<void>(
                                    builder: (BuildContext context) =>
                                        const ForgotPasswordPage(),
                                  ),
                                );
                              },
                              child: const Text(
                                "Quên mật khẩu",
                                style: TextStyle(
                                    color: Color(0xFF091E8E), fontSize: 16),
                              ),
                            )),
                        InkWell(
                          onTap: () {
                            if (context
                                    .read<LoginCubit>()
                                    .password
                                    .text
                                    .isEmpty ||
                                context.read<LoginCubit>().email.text.isEmpty) {
                              showToast(
                                context: context,
                                msg: "Nhập đủ thông tin",
                                color: const Color.fromARGB(255, 255, 179, 86),
                                icon: const Icon(Icons.info),
                              );
                            } else {
                              context.read<LoginCubit>().login();
                            }
                          },
                          child: Container(
                            margin: const EdgeInsets.only(top: 40, bottom: 10),
                            height: 40,
                            width: 250,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color(0xFF5266D4),
                            ),
                            child: const Center(
                              child: Text(
                                "Đăng nhập",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push<void>(
                              context,
                              MaterialPageRoute<void>(
                                builder: (BuildContext context) =>
                                    MultiBlocProvider(providers: [
                                  BlocProvider(
                                    create: (context) => RegisterCubit(),
                                  ),
                                ], child: const RegisterPage()),
                              ),
                            );
                          },
                          child: const Text(
                            "Bạn chưa có tài khoản? Đăng ký",
                            style: TextStyle(
                                color: Color(0xFF091E8E), fontSize: 15),
                          ),
                        )
                      ],
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
