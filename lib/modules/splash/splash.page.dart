import 'package:fe/constant/will.pop.scope.dart';
import 'package:fe/modules/login/login.cubit.dart';
import 'package:fe/modules/login/login.page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../register/register.cubit.dart';
import '../register/register.page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPS(
      child: Scaffold(
        body: Container(
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
                    top: MediaQuery.of(context).size.height * 0.13, bottom: 20),
                width: 90,
                height: 90,
                child: Image.asset("assets/logo.png", fit: BoxFit.contain),
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
                  margin: const EdgeInsets.only(top: 60),
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Image.asset("assets/image2.png", fit: BoxFit.contain)),
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
                child: Container(
                  margin: const EdgeInsets.only(top: 100),
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
                child: Container(
                  margin: const EdgeInsets.only(top: 15),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
