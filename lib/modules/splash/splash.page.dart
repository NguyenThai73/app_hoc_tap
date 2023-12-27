import 'package:fe/constant/will.pop.scope.dart';
import 'package:fe/modules/login/login.cubit.dart';
import 'package:fe/modules/login/login.page.dart';
import 'package:fe/modules/navigator/navigator.page.dart';
import 'package:fe/provider/nguoi.dung.provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  int checkLogin = 2;
  // void getData() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   var idUser = prefs.getInt("role");
  //   if (idUser != null) {
  //     var user = await NguoiDungProvider.getUserById(id: idUser.toString());
  //     if (user.id != null) {
  //       checkLogin = 1;
  //     } else {
  //       checkLogin = 2;
  //     }
  //   } else {
  //     checkLogin = 2;
  //   }
  //   setState(() {
      
  //   });
  // }

  @override
  void initState() {
    super.initState();
    // getData();
  }

  @override
  Widget build(BuildContext context) {
    if (checkLogin == 1) {
      Navigator.push<void>(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => const NavigatorPage(),
        ),
      );
    }
    return WillPS(
      child: checkLogin == 0
          ? Scaffold(
              body: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(
                  color: Color(0xFF5266D4),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 90,
                      height: 90,
                      child:
                          Image.asset("assets/logo.png", fit: BoxFit.contain),
                    ),
                    const Text(
                      "StulnforPro",
                      style: TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 2),
                    ),
                  ],
                ),
              ),
            )
          : checkLogin == 2
              ? Scaffold(
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
                            margin: const EdgeInsets.only(top: 60),
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: Image.asset("assets/image2.png",
                                fit: BoxFit.contain)),
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
                        // InkWell(
                        //   onTap: () {
                        //     Navigator.push<void>(
                        //       context,
                        //       MaterialPageRoute<void>(
                        //         builder: (BuildContext context) =>
                        //             MultiBlocProvider(providers: [
                        //           BlocProvider(
                        //             create: (context) => RegisterCubit(),
                        //           ),
                        //         ], child: const RegisterPage()),
                        //       ),
                        //     );
                        //   },
                        //   child: Container(
                        //     margin: const EdgeInsets.only(top: 15),
                        //     height: 40,
                        //     width: 250,
                        //     decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.circular(20),
                        //       color: const Color(0xFF5266D4),
                        //     ),
                        //     child: const Center(
                        //       child: Text(
                        //         "Đăng ký",
                        //         style: TextStyle(
                        //             color: Colors.white,
                        //             fontWeight: FontWeight.w600,
                        //             fontSize: 16),
                        //       ),
                        //     ),
                        //   ),
                        // )
                      ],
                    ),
                  ),
                )
              : Scaffold(
                  body: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: const BoxDecoration(
                      color: Color(0xFF5266D4),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
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
                      ],
                    ),
                  ),
                ),
    );
  }
}
