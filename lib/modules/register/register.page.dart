import 'package:fe/constant/no.focus.scope.dart';
import 'package:fe/constant/text.field.component.dart';
import 'package:fe/modules/login/login.page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../login/login.cubit.dart';
import 'register.cubit.dart';
import 'register.cubit.state.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            NoFocusScope(
              child: BlocConsumer<RegisterCubit, RegisterCubitState>(
                listener: (context, state) {},
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
                                top: MediaQuery.of(context).size.height * 0.1,
                                bottom:
                                    MediaQuery.of(context).size.height * 0.1),
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: Image.asset("assets/image14.png",
                                fit: BoxFit.contain)),
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
                        TextFielComponent(
                          controller: context.read<RegisterCubit>().password,
                          iconData: Icons.lock,
                          hintText: "Mật khẩu",
                          isPassword: true,
                        ),
                        const SizedBox(height: 20),
                        TextFielComponent(
                          controller:
                              context.read<RegisterCubit>().confirmPassword,
                          iconData: Icons.lock,
                          hintText: "Nhập lại mật khẩu",
                          isPassword: true,
                        ),
                        InkWell(
                          onTap: () {
                            context.read<RegisterCubit>().login();
                          },
                          child: Container(
                            margin: const EdgeInsets.only(top: 70, bottom: 10),
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
                        InkWell(
                          onTap: () {
                            Navigator.push<void>(
                              context,
                              MaterialPageRoute<void>(
                                builder: (BuildContext context) =>
                                    MultiBlocProvider(providers: [
                                  BlocProvider(
                                    create: (context) => LoginCubit(),
                                  ),
                                ], child: const LoginPage()),
                              ),
                            );
                          },
                          child: const Text(
                            "Bạn đã có tài khoản? Đăng nhập",
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
