// ignore_for_file: use_build_context_synchronously

import 'package:email_otp/email_otp.dart';
import 'package:fe/constant/loading.dart';
import 'package:fe/constant/no.focus.scope.dart';
import 'package:fe/constant/text.field.component.dart';
import 'package:fe/modules/forgotpass/verify.otp.screen.dart';
import 'package:fe/provider/nguoi.dung.provider.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  EmailOTP myauth = EmailOTP();
  TextEditingController email = TextEditingController();

  get userModel => null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            NoFocusScope(
                child: Container(
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
                      margin: const EdgeInsets.only(top: 10),
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Image.asset("assets/image15.png",
                          fit: BoxFit.contain)),
                  const SizedBox(height: 30),
                  TextFielComponent(
                    controller: email,
                    iconData: Icons.email,
                    hintText: "Nhập email",
                  ),
                  const SizedBox(height: 20),
                  InkWell(
                    onTap: () async {
                      onLoading(context);

                      var user =
                          await NguoiDungProvider.getUserByEmail(email.text);
                      if (user != null && user.role == 2) {
                        myauth.setConfig(
                            appEmail: "me@rohitchouhan.com",
                            appName: "StulnforPro Email OTP",
                            userEmail: email.text,
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
                                  VerifyOtpForgotPassWordScreen(
                                myauth: myauth,
                                userModel: user,
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
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text("Không tồn tại tài khoản nào!"),
                        ));
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
                          "Gửi mã",
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
            )),
          ],
        ),
      ),
    );
  }
}
