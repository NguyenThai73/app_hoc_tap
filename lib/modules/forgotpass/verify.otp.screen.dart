// ignore_for_file: use_build_context_synchronously, prefer_interpolation_to_compose_strings, avoid_print
import 'package:email_otp/email_otp.dart';
import 'package:fe/model/user.model.dart';
import 'package:fe/modules/forgotpass/nhap.pass.page.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

class VerifyOtpForgotPassWordScreen extends StatefulWidget {
  final UserModel userModel;
  final EmailOTP myauth;
  const VerifyOtpForgotPassWordScreen(
      {super.key, required this.userModel, required this.myauth});

  @override
  State<VerifyOtpForgotPassWordScreen> createState() => _VerifyOtpForgotPassWordScreenState();
}

class _VerifyOtpForgotPassWordScreenState extends State<VerifyOtpForgotPassWordScreen> {
  OtpFieldController otpController = OtpFieldController();
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
              "Xác thực OTP",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w500),
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
        body: Center(
          child: OTPTextField(
              controller: otpController,
              length: 6,
              width: MediaQuery.of(context).size.width,
              textFieldAlignment: MainAxisAlignment.spaceAround,
              fieldWidth: 45,
              fieldStyle: FieldStyle.box,
              outlineBorderRadius: 15,
              style: const TextStyle(fontSize: 17),
              onChanged: (pin) {
                print("Changed: " + pin);
              },
              onCompleted: (pin) async {
                if (await widget.myauth.verifyOTP(otp: pin) == true) {
                  Navigator.push<void>(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) =>
                          PasswordForgotPage(userModel: widget.userModel),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("OTP không đúng"),
                  ));
                }
              }),
        ));
  }
}
